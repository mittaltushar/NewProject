// To parse this JSON data, do
//
//     final videoMaterialData = videoMaterialDataFromJson(jsonString);

import 'dart:convert';

VideoMaterialData videoMaterialDataFromJson(String str) => VideoMaterialData.fromJson(json.decode(str));

String videoMaterialDataToJson(VideoMaterialData data) => json.encode(data.toJson());

class VideoMaterialData {
  List<Payload> payload;
  String message;
  String devMessage;
  String type;
  int code;

  VideoMaterialData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory VideoMaterialData.fromJson(Map<String, dynamic> json) => VideoMaterialData(
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
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

class Payload {
  int id;
  String title;
  String description;
  String createdTime;

  Payload({
    required this.id,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdTime: json["created_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "created_time": createdTime,
  };
}
