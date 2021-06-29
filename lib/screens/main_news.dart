
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter_app/model/news.dart';
import 'package:test_flutter_app/repositories/authentication.dart';

class MainScreen extends StatefulWidget{

  final String token;

  MainScreen(this.token);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }

}

class _MainScreenState extends State<MainScreen>{
  List<News> currentNews = [];


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: currentNews.length,
            itemBuilder: (context, i) {
              return _card(currentNews[i]);
            }),
      ),
    );
  }

  Widget _card(News news){
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(news.firstName + " " + news.lastName, style: TextStyle(fontSize: 16, color: Colors.black),)
              ],
            ),
            Text(news.caption!, style: TextStyle(fontSize: 16, color: Colors.black54))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (currentNews.isEmpty){
      getNews();
    }
    super.initState();
  }

  void getNews(){
    AuthenticationRepository authenticationRepository = new AuthenticationRepository();
    Future<List<News>> news = authenticationRepository.getNews(widget.token);

    news.then((value) {
      //print('size value: ' + value.length.toString());
      setState(() {
        currentNews = value;
        redefinitionNews();
      });
    });
  }

  void redefinitionNews(){
    for (News news in currentNews){
      if (news.caption == null){
        news.caption = " ";
      }
    }
  }


}