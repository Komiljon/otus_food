import 'package:flutter/material.dart';

class AddNewRecept extends StatefulWidget {
  const AddNewRecept({super.key});

  @override
  State<AddNewRecept> createState() => _AddNewReceptState();
}

class _AddNewReceptState extends State<AddNewRecept> {
  final receptFormKey = GlobalKey<FormState>();
  var textControllerReceptName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новый рецепт'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: receptFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      labelText: 'Название рецепта',
                      filled: true,
                      fillColor: Color.fromRGBO(236, 236, 236, 1),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      isDense: true,
                    ),
                    controller: textControllerReceptName,
                    onSaved: (value) {
                      textControllerReceptName.text = value ?? '';
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 215,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(46, 204, 113, 1),
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            image: AssetImage('assets/icons/photo.png'),
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Добавить фото рецепта",
                            style: TextStyle(fontSize: 14, color: Color.fromRGBO(22, 89, 50, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Ингредиенты',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'нет ингредиентов',
                    style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 0, 0, 1)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 232,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _dialogIngredientBuilder(context);
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        maximumSize: const Size(232, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        side: const BorderSide(width: 1.0, color: Color.fromRGBO(22, 89, 50, 1)),
                      ),
                      child: const Text(
                        "Добавить ингредиент",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(22, 89, 50, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Шаги приготовления',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(22, 89, 50, 1)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'нет шагов приготовления',
                    style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 0, 0, 1)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 232,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _dialogRecepStepBuilder(context);
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        maximumSize: const Size(232, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        side: const BorderSide(width: 1.0, color: Color.fromRGBO(22, 89, 50, 1)),
                      ),
                      child: const Text(
                        "Добавить шаг",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(22, 89, 50, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 232,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          minimumSize: const Size(232, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          backgroundColor: const Color.fromRGBO(121, 118, 118, 1)),
                      child: const Text(
                        'Сохранить рецепт',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _dialogIngredientBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final formKey = GlobalKey<FormState>();
          var textControllerIngrName = TextEditingController();
          var textControllerIngrCount = TextEditingController();
          return AlertDialog(
            title: const Text('Ингредиент'),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
            contentPadding: const EdgeInsets.all(0.0),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Название ингредиента',
                        filled: true,
                        fillColor: Color.fromRGBO(236, 236, 236, 1),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        isDense: true,
                      ),
                      controller: textControllerIngrName,
                      onSaved: (value) {
                        textControllerIngrName.text = value ?? '';
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Количество',
                        filled: true,
                        fillColor: Color.fromRGBO(236, 236, 236, 1),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        isDense: true,
                      ),
                      controller: textControllerIngrCount,
                      onSaved: (value) {
                        textControllerIngrCount.text = value ?? '';
                      },
                    ),
                    const SizedBox(height: 60),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            minimumSize: const Size(232, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            backgroundColor: const Color.fromRGBO(46, 204, 113, 1)),
                        child: const Text(
                          'Добавить',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),

                  ],
                ),
              ),              
            ],
          );
        },
      );
    },
  );
}

Future<void> _dialogRecepStepBuilder(BuildContext context) {
  return showDialog(
    useSafeArea : false,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final formKey = GlobalKey<FormState>();
          var textControllerStepDesc = TextEditingController();
          var textControllerStepMinute = TextEditingController();
          var textControllerStepSecund = TextEditingController();
          return AlertDialog(
            title: const Text('Шаг рецепта'),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
            contentPadding: const EdgeInsets.all(0.0),
            scrollable: true,
            actions: <Widget>[
              Form(
                key: formKey,
                child: Column(                  
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Описание шага',
                        filled: true,
                        fillColor: Color.fromRGBO(236, 236, 236, 1),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        isDense: true,
                      ),
                      maxLines: 10,
                      minLines: 4,
                      controller: textControllerStepDesc,
                      onSaved: (value) {
                        textControllerStepDesc.text = value ?? '';
                      },
                    ),
                
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Длительность шага',
                          style: TextStyle(fontSize: 10, color: Color.fromRGBO(0, 0, 0, 1)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: '',
                              labelText: 'Минуты',
                              filled: true,
                              fillColor: Color.fromRGBO(236, 236, 236, 1),
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              isDense: true,
                            ),
                            maxLines: 1,
                            controller: textControllerStepMinute,
                            onSaved: (value) {
                              textControllerStepMinute.text = value ?? '';
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: '',
                              labelText: 'Секунды',
                              filled: true,
                              fillColor: Color.fromRGBO(236, 236, 236, 1),
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              isDense: true,
                            ),
                            maxLines: 1,
                            controller: textControllerStepSecund,
                            onSaved: (value) {
                              textControllerStepSecund.text = value ?? '';
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            minimumSize: const Size(232, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            backgroundColor: const Color.fromRGBO(46, 204, 113, 1)),
                        child: const Text(
                          'Добавить',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          );
        },
      );
    },
  );
}
