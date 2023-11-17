// To parse this JSON data, do
//
//     final resendOtpData = resendOtpDataFromJson(jsonString);

import 'dart:convert';

ResendOtpData resendOtpDataFromJson(String str) => ResendOtpData.fromJson(json.decode(str));

String resendOtpDataToJson(ResendOtpData data) => json.encode(data.toJson());

class ResendOtpData {
  ResendOtpData({
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

  factory ResendOtpData.fromJson(Map<String, dynamic> json) => ResendOtpData(
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
