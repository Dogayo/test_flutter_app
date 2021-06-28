import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
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
            _authorization()
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
            style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Roboto'),
          ),
        ));
  }

  Widget _authorization() {
    return Container(
        height: 450.0,
        width: 350.0,
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
                )),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 40, top: 30, bottom: 40),
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(labelText: "Nickname"),
                            keyboardType: TextInputType.name
                        ),
                        width: 250,
                      ),
                      Container(
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(labelText: "Password"),
                          obscureText: true,
                        ),
                        width: 250,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [const Color(0xFFE74249), const Color(0xFFBB4E75)],
                            ),
                          ),
                          child: MaterialButton(
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            onPressed: null,
                          ),
                        ),
                        width: 250,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text("Регистрируясь вы принимаете наши условия:", style: TextStyle(fontSize: 12)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Text("политику использования данных", style: TextStyle(fontSize: 12, color: Colors.blue, decoration: TextDecoration.underline)),
                            Text("политику в отношении файлов cookie", style: TextStyle(fontSize: 12, color: Colors.blue, decoration: TextDecoration.underline))
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


}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          gradient: gradient,
          boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.5),
            blurRadius: 1.5,
          ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
