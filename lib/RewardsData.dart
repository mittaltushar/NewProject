
// To parse this JSON data, do
//
//     final rewards = rewardsFromJson(jsonString);

import 'dart:convert';

Rewards rewardsFromJson(String str) => Rewards.fromJson(json.decode(str));

String rewardsToJson(Rewards data) => json.encode(data.toJson());

class Rewards {
  Payload20 payload;
  String message;
  String devMessage;
  String type;
  int code;

  Rewards({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory Rewards.fromJson(Map<String, dynamic> json) => Rewards(
    payload: Payload20.fromJson(json["payload"]),
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

class Payload20 {
  int totalRewards;
  List<RecentQuiz1> recentQuiz;

  Payload20({
    required this.totalRewards,
    required this.recentQuiz,
  });

  factory Payload20.fromJson(Map<String, dynamic> json) => Payload20(
    totalRewards: json["total_rewards"],
    recentQuiz: List<RecentQuiz1>.from(json["recent_quiz"].map((x) => RecentQuiz1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_rewards": totalRewards,
    "recent_quiz": List<dynamic>.from(recentQuiz.map((x) => x.toJson())),
  };
}

class RecentQuiz1 {
  int id;
  int topicId;
  int totalQuestion;
  int perQMark;
  int totalMarks;
  String topicName;
  String topicDescription;
  String topicStatus;
  String createdTime;
  int userAttempt;
  int userGetMarks;
  String reward;
  String rewardIcon;

  RecentQuiz1({
    required this.id,
    required this.topicId,
    required this.totalQuestion,
    required this.perQMark,
    required this.totalMarks,
    required this.topicName,
    required this.topicDescription,
    required this.topicStatus,
    required this.createdTime,
    required this.userAttempt,
    required this.userGetMarks,
    required this.reward,
    required this.rewardIcon,
  });

  factory RecentQuiz1.fromJson(Map<String, dynamic> json) => RecentQuiz1(
    id: json["id"],
    topicId: json["topic_id"],
    totalQuestion: json["total_question"],
    perQMark: json["per_q_mark"],
    totalMarks: json["total_marks"],
    topicName: json["topic_name"],
    topicDescription: json["topic_description"],
    topicStatus: json["topic_status"],
    createdTime: json["created_time"],
    userAttempt: json["user_attempt"],
    userGetMarks: json["user_get_marks"],
    reward: json["reward"],
    rewardIcon: json["reward_icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic_id": topicId,
    "total_question": totalQuestion,
    "per_q_mark": perQMark,
    "total_marks": totalMarks,
    "topic_name": topicName,
    "topic_description": topicDescription,
    "topic_status": topicStatus,
    "created_time": createdTime,
    "user_attempt": userAttempt,
    "user_get_marks": userGetMarks,
    "reward": reward,
    "reward_icon": rewardIcon,
  };
}
