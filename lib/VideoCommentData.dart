// To parse this JSON data, do
//
//     final videoCommentData = videoCommentDataFromJson(jsonString);

import 'dart:convert';

VideoCommentData videoCommentDataFromJson(String str) => VideoCommentData.fromJson(json.decode(str));

String videoCommentDataToJson(VideoCommentData data) => json.encode(data.toJson());

class VideoCommentData {
  List<Payload> payload;
  String message;
  String devMessage;
  String type;
  int code;

  VideoCommentData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory VideoCommentData.fromJson(Map<String, dynamic> json) => VideoCommentData(
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
  int videoTopicId;
  int videoId;
  String createdTime;
  int userId;
  String name;
  String profileImg;
  String content;

  Payload({
    required this.id,
    required this.videoTopicId,
    required this.videoId,
    required this.createdTime,
    required this.userId,
    required this.name,
    required this.profileImg,
    required this.content,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    videoTopicId: json["video_topic_id"],
    videoId: json["video_id"],
    createdTime: json["created_time"],
    userId: json["user_id"],
    name: json["name"],
    profileImg: json["profile_img"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video_topic_id": videoTopicId,
    "video_id": videoId,
    "created_time": createdTime,
    "user_id": userId,
    "name": name,
    "profile_img": profileImg,
    "content": content,
  };
}
