// To parse this JSON data, do
//
//     final forgetPasswordVerifyData = forgetPasswordVerifyDataFromJson(jsonString);

import 'dart:convert';

ForgetPasswordVerifyData forgetPasswordVerifyDataFromJson(String str) => ForgetPasswordVerifyData.fromJson(json.decode(str));

String forgetPasswordVerifyDataToJson(ForgetPasswordVerifyData data) => json.encode(data.toJson());

class ForgetPasswordVerifyData {
  ForgetPasswordVerifyData({
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

  factory ForgetPasswordVerifyData.fromJson(Map<String, dynamic> json) => ForgetPasswordVerifyData(
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
