// To parse this JSON data, do
//
//     final placeData2 = placeData2FromJson(jsonString);

import 'dart:convert';

List<PlaceData2> placeData2FromJson(String str) => List<PlaceData2>.from(json.decode(str).map((x) => PlaceData2.fromJson(x)));

String placeData2ToJson(List<PlaceData2> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceData2 {
  int userId;
  int id;
  String title;
  String body;

  PlaceData2({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PlaceData2.fromJson(Map<String, dynamic> json) => PlaceData2(
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
