import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:test_flutter_app/model/news.dart';
import 'package:test_flutter_app/repositories/authentication.dart';

class MainScreen extends StatefulWidget {
  final String token;

  MainScreen(this.token);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<News> currentNews = [];
  List<bool> _likes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("News", style: TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: _list(),
    );
  }

  Widget _list(){
    return Container(
        color: Colors.white,
        child: currentNews.length != 0 ? ListView.builder(
            itemCount: currentNews.length,
            itemBuilder: (context, i) {
              return _card(currentNews[i], i);
            })
            : const Center(child: Text('No items', style: TextStyle(fontSize: 20, color: Colors.orange),))
    );
  }

  Widget _card(News news, int index) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(40.0),
        bottomRight: const Radius.circular(40.0),
      )),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                    image: AssetImage("assets/avatar.png"),),
                Container(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    news.firstName + " " + news.lastName,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              ],
            ),
            Row(
                children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 10),
                width: MediaQuery.of(context).size.width*0.8,
                child: Text(news.caption!,
                    style: TextStyle(fontSize: 16, color: Colors.black54), textAlign: TextAlign.left,),
              )
            ]),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _likes[index] = !_likes[index];
                      });
                    },
                    icon: Icon(Icons.favorite_border,
                        color: _likes[index] ? Colors.red : Colors.grey,
                        size: 25.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Image(
                    image: AssetImage("assets/comment.png"),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (currentNews.isEmpty) {
      getNews();
    }
    super.initState();
  }

  void getNews() {
    AuthenticationRepository authenticationRepository =
        new AuthenticationRepository();
    Future<List<News>> news = authenticationRepository.getNews(widget.token);

    news.then((value) {
      //print('size value: ' + value.length.toString());
      setState(() {
        currentNews = value;
        _likes = List.filled(currentNews.length, false);
        redefinitionNews();
      });
    });
    /*setState(() {
      fillList();
      _likes = List.filled(currentNews.length, false);
      redefinitionNews();
    });*/
  }

  void redefinitionNews() {
    for (News news in currentNews) {
      if (news.caption == null) {
        news.caption = " ";
      }
    }
  }

  void fillList(){
    for (int i = 1; i < 25; i++){
      currentNews.add(News(id: i,
              caption: "Приложения Flutter могут включать в себя как код, так и ресурсы (иногда называемые ресурсами). "
                  "Ресурс - это файл, который объединен и развернут с вашим приложением и доступен во время выполнения. "
                  "Общие типы ресурсов включают статические данные (например, файлы JSON), файлы конфигурации, значки и изображения (JPEG, WebP, GIF, анимированные WebP / GIF, PNG, BMP и WBMP).",
          firstName: "test",
          lastName: "test"));
    }
  }
}
