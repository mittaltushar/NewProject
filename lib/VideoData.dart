// To parse this JSON data, do
//
//     final videoData = videoDataFromJson(jsonString);

import 'dart:convert';

VideoData videoDataFromJson(String str) => VideoData.fromJson(json.decode(str));

String videoDataToJson(VideoData data) => json.encode(data.toJson());

class VideoData {
  Payload payload;
  String message;
  String devMessage;
  String type;
  int code;

  VideoData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
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
  String title;
  String description;
  String videoUrl;
  String videoId;
  String topicId;

  Payload({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.videoId,
    required this.topicId,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    videoUrl: json["video_url"],
    videoId: json["videoId"],
    topicId: json["topicId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "video_url": videoUrl,
    "videoId": videoId,
    "topicId": topicId,
  };
}
