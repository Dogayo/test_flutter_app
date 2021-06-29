
class News {

  int id;
  String? caption;
  String firstName;
  String lastName;

  News({
    required this.id,
    this.caption,
    required this.firstName,
    required this.lastName,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    caption: json["caption"],
    firstName: json["user"]['firstName'],
    lastName: json["user"]['lastName']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption,
    "firstName": firstName,
    "lastName": lastName,
  };

}


