import 'package:flutter/material.dart';
import '../model/food_detail.dart';
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

  @override
  void initState() {
    super.initState();
    id = widget.id;
    foodDetailData = getFoodData(id);
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
                                child:const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      IngredietRow(name: 'Соевый соус', wedghts: '8 ст. ложек',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Вода', wedghts: '8 ст. ложек',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Мёд', wedghts: '3 ст. ложки',),

                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Коричневый сахар', wedghts: '2 ст. ложки',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Чеснок', wedghts: '3 зубчика',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Тёртый свежий имбирь', wedghts: '1 ст. ложка',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Лимонный сок', wedghts: '1¹⁄₂ ст. ложки',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Кукурузный крахмал', wedghts: '1 ст. ложка',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Растительное масло', wedghts: '1 ч. ложка',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Филе лосося или сёмги', wedghts: '680 г',),
                                      SizedBox(height: 5,),
                                      IngredietRow(name: 'Кунжут', wedghts: 'по вкусу',),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16,),
                              const Text('Шаги приготовления', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
        
                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '1', ingText: 'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.', ingTime: '06:00',),
        
                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '2', ingText: 'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.', ingTime: '07:00',),
        
                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '3', ingText: 'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.', ingTime: '06:00',),

                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '4', ingText: 'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.', ingTime: '01:00',),

                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '5', ingText: 'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.', ingTime: '06:00',),

                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '5', ingText: 'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.', ingTime: '15:00',),

                              const SizedBox(height: 16,),
                              const IngredietSteps(nomer: '7', ingText: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.', ingTime: '06:00',),

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
                          );
                        },
                    );
                  }else if (snapshot.hasError) {
                    return const Text('Нет данных');
                  }
                  return const Center(child: CircularProgressIndicator());
                }
              ), 
            ],
          ),
        )),
      ),
      
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 0, selected: true),
    );
  }
}