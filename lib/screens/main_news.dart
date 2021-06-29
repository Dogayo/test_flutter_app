import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget{

  final token;

  const MainScreen(this.token);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Это второе окно!", style: TextStyle(fontSize: 12, color: Colors.green)),
            Text("Token: $token", style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        )

      ),
    );
  }

}