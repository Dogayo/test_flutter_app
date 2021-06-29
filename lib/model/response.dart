import 'dart:convert' as json;


class Answer {

  int statusCode;
  Result result;

  Answer({
    required this.statusCode,
    required this.result,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    statusCode: json["statusCode"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "result": result,
  };

}

class Result{
  String access;
  String refresh;

  Result({
    required this.access,
    required this.refresh,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    access: json["access"],
    refresh: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "access": access,
    "refresh": refresh,
  };
}

