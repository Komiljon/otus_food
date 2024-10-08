import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  final _formKey = GlobalKey<FormState>();

  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  final _inputKey1 = GlobalKey();
  final _inputKey2 = GlobalKey();
  final _inputKey3 = GlobalKey();

  bool isRegister = false;

  @override
  void initState() {
    super.initState();
    isRegister = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 204, 113, 1),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        top: true,
        child: SingleChildScrollView(
          child: SizedBox(
            height: (MediaQuery.of(context).size.height > 600) ? MediaQuery.of(context).size.height - 150 : 600,
            child: Center(
                child: SizedBox(
              width: 232,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'Otus.Food',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          height: 270,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: _inputKey1,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    labelText: 'логин',
                                    labelStyle: const TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Color.fromRGBO(194, 194, 194, 1),
                                      size: 24,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(bottom: 5),
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                  ),
                                  controller: textController1,
                                  onFieldSubmitted: (item) {},
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  key: _inputKey2,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    labelText: 'пароль',
                                    labelStyle: const TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    prefixIcon: const Icon(
                                      Icons.https,
                                      color: Color.fromRGBO(194, 194, 194, 1),
                                      size: 24,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(bottom: 5),
                                    isDense: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                  ),
                                  controller: textController2,
                                  onFieldSubmitted: (item) {},
                                ),
                                if (isRegister)
                                  const SizedBox(
                                    height: 16,
                                  ),
                                if (isRegister)
                                  TextFormField(
                                    key: _inputKey3,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      labelText: 'пароль еще раз',
                                      labelStyle: const TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      prefixIcon: const Icon(
                                        Icons.https,
                                        color: Color.fromRGBO(194, 194, 194, 1),
                                        size: 24,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(bottom: 5),
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    controller: textController3,
                                    onFieldSubmitted: (item) {},
                                  ),
                                const SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  width: 232,
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(22, 89, 50, 1), // This is what you need!
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      (isRegister) ? 'Регистрация' : 'Войти',
                                      style: const TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SelectableText(
                      (isRegister) ? 'Войти в приложение' : 'Зарегистрироваться',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      onTap: () {
                        setState(() {
                          isRegister = !isRegister;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 3, selected: true),
    );
  }
}
