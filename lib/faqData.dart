// To parse this JSON data, do
//
//     final faqData = faqDataFromJson(jsonString);

import 'dart:convert';

FaqData faqDataFromJson(String str) => FaqData.fromJson(json.decode(str));

String faqDataToJson(FaqData data) => json.encode(data.toJson());

class FaqData {
  List<Payload11>? payload;
  String message;
  String devMessage;
  String type;
  int code;

  FaqData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory FaqData.fromJson(Map<String, dynamic> json) => FaqData(
    payload: List<Payload11>.from(json["payload"].map((x) => Payload11.fromJson(x))),
    message: json["message"],
    devMessage: json["dev_message"],
    type: json["type"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
    "message": message,
    "dev_message": devMessage,
    "type": type,
    "code": code,
  };
}

class Payload11 {
  int id;
  String title;
  String details;

  Payload11({
    required this.id,
    required this.title,
    required this.details,
  });

  factory Payload11.fromJson(Map<String, dynamic> json) => Payload11(
    id: json["id"],
    title: json["title"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "details": details,
  };
}
