import 'package:flutter/material.dart';
import '../model/food_detail.dart';
import '../model/ingridients.dart';
import '../model/recept_steps.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/ingredient_row.dart';
import '../widgets/ingredient_steps.dart';

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

  @override
  void initState() {
    super.initState();
    id = widget.id;
    foodDetailData = getFoodData(id);
    ingridientsData = getIngridientList(id);
    receptStepsData = getReceptSteps(id);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Рецепт', style: TextStyle(fontSize: 20, color: Color.fromRGBO(22, 89, 50, 1))),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color.fromRGBO(0, 0, 0, 1)),
        actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        )
      ],
      shape:
          const Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1)),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                              Text('${snapshot.data?.name}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                              const SizedBox(height: 10,),
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
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Text('${snapshot.data?.duration} минут', style: const TextStyle(fontSize: 16, color: Color.fromRGBO(46, 204, 113, 1)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ]
                              ),
                              const SizedBox(height: 16,),
                              Center(
                              child: ClipRRect(
                                  borderRadius:BorderRadius.circular(5.0),
                                  child: Image.network('${snapshot.data?.photo}',
                                    width: MediaQuery.of(context).size.width -20.0,
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                    );
                  }else if (snapshot.hasError) {
                    return const Text('Нет данных');
                  }
                  return const Center(child: CircularProgressIndicator());
                }
              ), 
              const SizedBox(height: 16,),
              const Text('Ингредиенты', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
              const SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(121, 118, 118, 1),
                    width: 3
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<IngredientModel>(
                  future: ingridientsData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        itemBuilder: (context, index) => IngredietRow(
                          name: snapshot.data!.ingredients?[index].name, wedghts: snapshot.data!.ingredients?[index].count,
                        ),
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
              const SizedBox(height: 16,),
              const Text('Шаги приготовления', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

              const SizedBox(height: 16,),
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

              const SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(22, 89, 50, 1), // This is what you need!
                  ),
                  onPressed: () {},
                  child: const Text('Начать готовить', style: TextStyle(color: Colors.white),),
                                              ),
                ],
              ),
            ],
          ),
        )),
      ),
      
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}