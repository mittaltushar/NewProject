// To parse this JSON data, do
//
//     final nationalityData = nationalityDataFromJson(jsonString);

import 'dart:convert';

NationalityData nationalityDataFromJson(String str) => NationalityData.fromJson(json.decode(str));

String nationalityDataToJson(NationalityData data) => json.encode(data.toJson());

class NationalityData {
  NationalityData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  List<Payload3> payload;
  String message;
  String devMessage;
  String type;
  int code;

  factory NationalityData.fromJson(Map<String, dynamic> json) => NationalityData(
    payload: List<Payload3>.from(json["payload"].map((x) => Payload3.fromJson(x))),
    message: json["message"],
    devMessage: json["dev_message"],
    type: json["type"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
    "message": message,
    "dev_message": devMessage,
    "type": type,
    "code": code,
  };
}

class Payload3 {
  Payload3({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Payload3.fromJson(Map<String, dynamic> json) => Payload3(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
