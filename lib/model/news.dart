
class News {

  int id;
  String caption;
  String username;

  News({
    required this.id,
    required this.caption,
    required this.username,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    caption: json["caption"],
    username: json["username"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption,
    "username": username,
  };

}


