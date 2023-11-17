// To parse this JSON data, do
//
//     final saveAnswerData = saveAnswerDataFromJson(jsonString);

import 'dart:convert';

SaveAnswerData saveAnswerDataFromJson(String str) => SaveAnswerData.fromJson(json.decode(str));

String saveAnswerDataToJson(SaveAnswerData data) => json.encode(data.toJson());

class SaveAnswerData {
  Payload payload;
  String message;
  String devMessage;
  String type;
  int code;

  SaveAnswerData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory SaveAnswerData.fromJson(Map<String, dynamic> json) => SaveAnswerData(
    payload: Payload.fromJson(json["payload"]),
    message: json["message"],
    devMessage: json["dev_message"],
    type: json["type"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "payload": payload.toJson(),
    "message": message,
    "dev_message": devMessage,
    "type": type,
    "code": code,
  };
}

class Payload {
  Payload();

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
  );

  Map<String, dynamic> toJson() => {
  };
}
