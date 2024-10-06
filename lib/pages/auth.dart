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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 204, 113, 1),
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        top: true,
        child: Center(
            child: SizedBox(
          width: 232,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Otus.Food'),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: _inputKey1,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Логин',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromRGBO(194, 194, 194, 1),
                          size: 24,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(bottom: 5),
                        isDense: true,
                      ),
                      controller: textController1,
                      onFieldSubmitted: (item) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      key: _inputKey2,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Пароль',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Icons.https,
                          color: Color.fromRGBO(194, 194, 194, 1),
                          size: 24,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(bottom: 5),
                        isDense: true,
                      ),
                      controller: textController2,
                      onFieldSubmitted: (item) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      key: _inputKey3,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Еще раз',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Icons.https,
                          color: Color.fromRGBO(194, 194, 194, 1),
                          size: 24,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(bottom: 5),
                        isDense: true,
                      ),
                      controller: textController3,
                      onFieldSubmitted: (item) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 232,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(22, 89, 50, 1), // This is what you need!
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Войти',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: const AkaBottomNavigationBar(curIndexs: 3, selected: true),
    );
  }
}
