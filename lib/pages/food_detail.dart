import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../db/db_model.dart';
import '../db/hive_service.dart';
import '../generated/l10n.dart';
import '../model/food_detail.dart';
import '../model/ingridients.dart';
import '../model/recept_steps.dart';
import '../providers/provider.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/comment_widget.dart';
import '../widgets/ingredient_row.dart';
import '../widgets/recept_steps.dart';

class FoodDetail extends StatefulWidget {
  final int id;
  const FoodDetail({super.key, required this.id});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  late int id;
  late Future<FoodDetailModel> foodDetailData;
  late Future<IngredientModel> ingridientsData;
  late Future<StepsModel> receptStepsData;

  bool actives = false;
  bool favorite = false;
  final CustomPainter painter = SimplePainter();

  checkFavoriteProduct(int id) {
    List<DbFavoriteModel> listFavProduct = <DbFavoriteModel>[];
    listFavProduct = HiveService.getAllFavProducts();
    if (listFavProduct.isNotEmpty) {
      for (var element in listFavProduct) {
        if (element.id == id) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    actives = false;
    id = widget.id;
    foodDetailData = getFoodData(id);
    ingridientsData = getIngridientList();
    receptStepsData = getReceptSteps(id);
    favorite = checkFavoriteProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).recipe, style: const TextStyle(fontSize: 20, color: Color.fromRGBO(22, 89, 50, 1))),
        centerTitle: true,
        backgroundColor: actives ? const Color.fromRGBO(46, 204, 113, 1) : Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color.fromRGBO(0, 0, 0, 1)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          )
        ],
        shape: const Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1)),
        bottom: PreferredSize(
          preferredSize: actives ? const Size.fromHeight(kToolbarHeight) : Size.zero,
          child: actives
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).timer,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '38:59',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FutureBuilder<FoodDetailModel>(
                        future: foodDetailData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!actives)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data?.name}',
                                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              if (!favorite) {
                                                context.read<FavProdProvider>().addToFavoriteProd(widget.id, 1);
                                                setState(() {
                                                  favorite = true;
                                                });
                                              } else {
                                                context.read<FavProdProvider>().deleteFavoriteProduct(widget.id);
                                                setState(() {
                                                  favorite = false;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 24,
                                              color: favorite
                                                  ? const Color.fromRGBO(191, 54, 12, 1)
                                                  : const Color.fromRGBO(0, 0, 0, 0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Image(
                                            image: AssetImage('assets/icons/clock_icon.png'),
                                            width: 16,
                                            height: 16,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data?.duration} минут',
                                              style: const TextStyle(fontSize: 16, color: Color.fromRGBO(46, 204, 113, 1)),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ]),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(5.0),
                                            child: Image.network(
                                              '${snapshot.data?.photo}',
                                              width: MediaQuery.of(context).size.width - 20.0,
                                              height: 220,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          if (favorite)
                                            Positioned(
                                              right: 5,
                                              bottom: 20,
                                              child: CustomPaint(
                                                size: const Size(66, 24),
                                                painter: painter,
                                              ),
                                            ),
                                          if (favorite)
                                            Positioned(
                                              right: 10,
                                              bottom: 22,
                                              child: Text(
                                                widget.id.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text(S.of(context).nodata);
                          }
                          return const Center(child: CircularProgressIndicator());
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      S.of(context).ingredients,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromRGBO(121, 118, 118, 1), width: 3),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder<IngredientModel>(
                          future: ingridientsData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: (widget.id == snapshot.data!.ingredients?[index].recipe?.id 
                                  && snapshot.data!.ingredients![index].count! > 0)?8:0,
                                ),
                                itemBuilder: (context, index){ 
                                  if(widget.id == snapshot.data!.ingredients?[index].recipe?.id && snapshot.data!.ingredients![index].count! > 0){
                                    return IngredietRow(
                                      id: snapshot.data!.ingredients![index].ingredient?.id,
                                      wedghts: snapshot.data!.ingredients?[index].count.toString(),
                                    );                                
                                  }
                                  return const SizedBox(height: 0,);
                                },
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.ingredients!.length,
                              );
                            } else if (snapshot.hasError) {
                              return const Center(child: Text('Error'));
                            }
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      S.of(context).cookingsteps,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      child: FutureBuilder<StepsModel>(
                        future: receptStepsData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 16,
                              ),
                              itemBuilder: (context, index) => IngredietSteps(
                                colorActive: actives,
                                checkActiveindex: index,
                                nomer: snapshot.data!.receptsteps![index].num.toString(),
                                ingText: snapshot.data!.receptsteps![index].ingText.toString(),
                                ingTime: snapshot.data!.receptsteps![index].ingTime.toString(),
                              ),
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.receptsteps!.length,
                            );
                          } else if (snapshot.hasError) {
                            return const Center(child: Text('Error'));
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        actives
                            ? OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    actives = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                                  maximumSize: const Size(232, 48),
                                  minimumSize: const Size(232, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  side: const BorderSide(width: 1.0, color: Color.fromRGBO(22, 89, 50, 1)),
                                ),
                                child: Text(
                                  S.of(context).endcooking,
                                  style:
                                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  maximumSize: const Size(232, 48),
                                  minimumSize: const Size(232, 48),
                                  backgroundColor: const Color.fromRGBO(22, 89, 50, 1), // This is what you need!
                                ),
                                onPressed: () {
                                  setState(() {
                                    actives = true;
                                  });
                                },
                                child: Text(
                                  S.of(context).startcooking,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: const Color.fromRGBO(121, 118, 118, 1),
            ),
            const SizedBox(
              height: 32,
            ),
            CommentWidget(id: widget.id),
          ],
        ),
      ),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}

class SimplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(46, 204, 113, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(66, 0);
    path.lineTo(66, 24);
    path.lineTo(0, 24);
    path.lineTo(30, 12);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
