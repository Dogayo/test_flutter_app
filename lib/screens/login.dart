import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter_app/repositories/authentication.dart';
import 'package:test_flutter_app/screens/main_news.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  TextEditingController _nickController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool checkFields() {
    String nickname = _nickController.value.text;
    String password = _passwordController.value.text;
    if (!nickname.contains(RegExp(r'[^\w\s]+')) && nickname.isNotEmpty
        && password.length >= 3 && password.length <= 9) {
      return true;
    } else {
      return false;
    }
  }

  void startMainScreen() {
    if (checkFields()) {
      setState(() {
        showToast("Переход на другой экран!", Colors.green, Colors.white);
        AuthenticationRepository authenticationRepository = AuthenticationRepository();
        Future<String> token = authenticationRepository.getToken();
        token.then((value) =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen({value}))));

      });
    } else {
      showToast("Данные в полях не корректны!", Colors.red, Colors.white);
    }
  }

  void showToast(String title, Color colorBackground, Color colorText){
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colorBackground,
        textColor: colorText,
        fontSize: 12.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [const Color(0xFFE74249), const Color(0xFFBB4E75)],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _logo(),
            _authorization(context)
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Padding(
        padding: EdgeInsets.only(bottom: 150, left: 40, top: 40),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Roboto'),
          ),
        ));
  }

  Widget _authorization(BuildContext context) {
    return Container(
        height: 450.0,
        width: 350.0,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                )),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      _input("Nickname", _nickController, false),
                      _input("Password", _passwordController, true),
                      _button(context),
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        child: Text("Регистрируясь вы принимаете наши условия:",
                            style: TextStyle(fontSize: 12)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Text("политику использования данных",
                                style: TextStyle(fontSize: 12, color: Colors
                                    .blue, decoration: TextDecoration
                                    .underline)),
                            Text("политику в отношении файлов cookie",
                                style: TextStyle(fontSize: 12, color: Colors
                                    .blue, decoration: TextDecoration
                                    .underline))
                          ],
                        ),
                      )

                    ],
                  ),
                )
              ],
            )
        )
    );
  }

  Widget _input(String label, TextEditingController controller,
      bool obscureText) {
    return Container(
      child: TextField(
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(labelText: label),
        obscureText: obscureText,
        obscuringCharacter: "*",
        controller: controller,
      ),
      width: 250,
    );
  }

  Widget _button(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(5.0)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [const Color(0xFFE74249), const Color(0xFFBB4E75)],
          ),
        ),
        child: MaterialButton(
          child: Text(
            'Sign in',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: startMainScreen,
        ),
      ),
      width: 250,
    );
  }
}
