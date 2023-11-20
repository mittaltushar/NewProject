// To parse this JSON data, do
//
//     final placeData3 = placeData3FromJson(jsonString);

import 'dart:convert';

PlaceData3 placeData3FromJson(String str) => PlaceData3.fromJson(json.decode(str));

String placeData3ToJson(PlaceData3 data) => json.encode(data.toJson());

class PlaceData3 {
  int userId;
  int id;
  String title;
  String body;

  PlaceData3({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PlaceData3.fromJson(Map<String, dynamic> json) => PlaceData3(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
