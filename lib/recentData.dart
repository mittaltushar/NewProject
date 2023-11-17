

import 'dart:convert';

RecentData recentDataFromJson(String str) => RecentData.fromJson(json.decode(str));

String recentDataToJson(RecentData data) => json.encode(data.toJson());

class RecentData {
  Payload payload;
  String message;
  String devMessage;
  String type;
  int code;

  RecentData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory RecentData.fromJson(Map<String, dynamic> json) => RecentData(
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
  List<Banner> banners;
  List<LatestQuiz> latestQuiz;
  List<LatestQuiz> tranding;
  List<LatestQuiz> studyMaterial;
  List<RecentQuiz> recentQuiz;

  Payload({
    required this.banners,
    required this.latestQuiz,
    required this.tranding,
    required this.studyMaterial,
    required this.recentQuiz,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    latestQuiz: List<LatestQuiz>.from(json["latest_quiz"].map((x) => LatestQuiz.fromJson(x))),
    tranding: List<LatestQuiz>.from(json["tranding"].map((x) => LatestQuiz.fromJson(x))),
    studyMaterial: List<LatestQuiz>.from(json["study_material"].map((x) => LatestQuiz.fromJson(x))),
    recentQuiz: List<RecentQuiz>.from(json["recent_quiz"].map((x) => RecentQuiz.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "latest_quiz": List<dynamic>.from(latestQuiz.map((x) => x.toJson())),
    "tranding": List<dynamic>.from(tranding.map((x) => x.toJson())),
    "study_material": List<dynamic>.from(studyMaterial.map((x) => x.toJson())),
    "recent_quiz": List<dynamic>.from(recentQuiz.map((x) => x.toJson())),
  };
}

class Banner {
  int id;
  String imageUrl;

  Banner({
    required this.id,
    required this.imageUrl,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
  };
}

class LatestQuiz {
  int id;
  String name;
  String imageUrl;
  String? slug;

  LatestQuiz({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.slug,
  });

  factory LatestQuiz.fromJson(Map<String, dynamic> json) => LatestQuiz(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image_url"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
    "slug": slug,
  };
}

class RecentQuiz {
  int id;
  int topicId;
  String topicName;
  String topicDescription;
  String topicStatus;

  RecentQuiz({
    required this.id,
    required this.topicId,
    required this.topicName,
    required this.topicDescription,
    required this.topicStatus,
  });

  factory RecentQuiz.fromJson(Map<String, dynamic> json) => RecentQuiz(
    id: json["id"],
    topicId: json["topic_id"],
    topicName: json["topic_name"],
    topicDescription: json["topic_description"],
    topicStatus: json["topic_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic_id": topicId,
    "topic_name": topicName,
    "topic_description": topicDescription,
    "topic_status": topicStatus,
  };
}

