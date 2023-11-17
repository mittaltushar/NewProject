// To parse this JSON data, do
//
//     final occupationModel = occupationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OccupationModel occupationModelFromJson(String str) => OccupationModel.fromJson(json.decode(str));

String occupationModelToJson(OccupationModel data) => json.encode(data.toJson());

class OccupationModel {
    OccupationModel({
        required this.payload,
        required this.message,
        required this.devMessage,
        required this.type,
        required this.code,
    });

    List<Payload1> payload;
    String message;
    String devMessage;
    String type;
    int code;

    factory OccupationModel.fromJson(Map<String, dynamic> json) => OccupationModel(
        payload: List<Payload1>.from(json["payload"].map((x) => Payload1.fromJson(x))),
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

class Payload1 {
    Payload1({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Payload1.fromJson(Map<String, dynamic> json) => Payload1(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
