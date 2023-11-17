class VideoTopic {
  List<Payload>? payload;
  String? message;
  String? devMessage;
  String? type;
  int? code;

  VideoTopic(
      {this.payload, this.message, this.devMessage, this.type, this.code});

  VideoTopic.fromJson(Map<String, dynamic> json) {
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(new Payload.fromJson(v));
      });
    }
    message = json['message'];
    devMessage = json['dev_message'];
    type = json['type'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['dev_message'] = this.devMessage;
    data['type'] = this.type;
    data['code'] = this.code;
    return data;
  }
}

class Payload {
  int? id;
  String? title;
  String? description;
  String? instructions;
  String? type;
  int? amount;
  int? noOfVideos;

  Payload(
      {this.id,
        this.title,
        this.description,
        this.instructions,
        this.type,
        this.amount,
        this.noOfVideos});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    instructions = json['instructions'];
    type = json['type'];
    amount = json['amount'];
    noOfVideos = json['no_of_videos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['instructions'] = this.instructions;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['no_of_videos'] = this.noOfVideos;
    return data;
  }
}
