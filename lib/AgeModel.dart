// To parse this JSON data, do
//
//     final ageModel = ageModelFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

AgeModel ageModelFromJson(String str) => AgeModel.fromJson(json.decode(str));

String ageModelToJson(AgeModel data) => json.encode(data.toJson());

class AgeModel {
    AgeModel({
        required this.payload,
        required this.message,
        required this.devMessage,
        required this.type,
        required this.code,
    });

    List<Payload2> payload;
    String message;
    String devMessage;
    String type;
    int code;

    factory AgeModel.fromJson(Map<String, dynamic> json) => AgeModel(
        payload: List<Payload2>.from(json["payload"].map((x) => Payload2.fromJson(x))),
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

class Payload2 {
    Payload2({
        required this.id,
        required this.name,
    });

    int id;
    String name = "";

    factory Payload2.fromJson(Map<String, dynamic> json) => Payload2(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
