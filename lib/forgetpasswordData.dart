// To parse this JSON data, do
//
//     final forgetPasswordData = forgetPasswordDataFromJson(jsonString);

import 'dart:convert';

ForgetPasswordData forgetPasswordDataFromJson(String str) => ForgetPasswordData.fromJson(json.decode(str));

String forgetPasswordDataToJson(ForgetPasswordData data) => json.encode(data.toJson());

class ForgetPasswordData {
  ForgetPasswordData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  Payload payload;
  String message;
  String devMessage;
  String type;
  int code;

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) => ForgetPasswordData(
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
