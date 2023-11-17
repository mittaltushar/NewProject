// To parse this JSON data, do
//
//     final contactInfo = contactInfoFromJson(jsonString);

import 'dart:convert';

ContactInfo contactInfoFromJson(String str) => ContactInfo.fromJson(json.decode(str));

String contactInfoToJson(ContactInfo data) => json.encode(data.toJson());

class ContactInfo {
  Payload payload;
  String message;
  String devMessage;
  String type;
  int code;

  ContactInfo({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
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
  int id;
  String name;
  String phone;
  String email;
  String address;

  Payload({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
  };
}
