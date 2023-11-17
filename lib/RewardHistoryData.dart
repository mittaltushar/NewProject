// To parse this JSON data, do
//
//     final rewardHistoryData = rewardHistoryDataFromJson(jsonString);

import 'dart:convert';

RewardHistoryData rewardHistoryDataFromJson(String str) => RewardHistoryData.fromJson(json.decode(str));

String rewardHistoryDataToJson(RewardHistoryData data) => json.encode(data.toJson());

class RewardHistoryData {
  List<Payload> payload;
  int totalRecords;
  String message;
  String type;
  int code;

  RewardHistoryData({
    required this.payload,
    required this.totalRecords,
    required this.message,
    required this.type,
    required this.code,
  });

  factory RewardHistoryData.fromJson(Map<String, dynamic> json) => RewardHistoryData(
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    totalRecords: json["totalRecords"],
    message: json["message"],
    type: json["type"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
    "totalRecords": totalRecords,
    "message": message,
    "type": type,
    "code": code,
  };
}

class Payload {
  int id;
  String title;
  String reward;
  String transitionStatus;
  String createdAt;

  Payload({
    required this.id,
    required this.title,
    required this.reward,
    required this.transitionStatus,
    required this.createdAt,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    title: json["title"]!,
    reward: json["reward"],
    transitionStatus: json["transition_status"]!,
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": titleValues.reverse[title],
    "reward": reward,
    "transition_status": transitionStatusValues.reverse[transitionStatus],
    "created_at": createdAt,
  };
}

enum Title {
  DAILY_ACTIVITY,
  FOR_LIKE_POST
}

final titleValues = EnumValues({
  "daily activity": Title.DAILY_ACTIVITY,
  "for like post": Title.FOR_LIKE_POST
});

enum TransitionStatus {
  CREDIT
}

final transitionStatusValues = EnumValues({
  "credit": TransitionStatus.CREDIT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
