// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
  Payload payload;
  String message;
  String devMessage;
  String type;
  int code;

  ProfileData({
    required this.payload,
    required this.message,
    required this.devMessage,
    required this.type,
    required this.code,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
  String email;
  String phone;
  String ageId;
  String ageName;
  String occupationId;
  String nationality;
  String deviceType;
  String deviceToken;
  String loginType;
  String profileImg;
  String addCommunityPost;
  String status;
  String marriedStatus;
  String farmerId;
  String createdOn;
  String bloodDonationStatus;
  String plantATreeStatus;
  String wallet;

  Payload({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.ageId,
    required this.ageName,
    required this.occupationId,
    required this.nationality,
    required this.deviceType,
    required this.deviceToken,
    required this.loginType,
    required this.profileImg,
    required this.addCommunityPost,
    required this.status,
    required this.marriedStatus,
    required this.farmerId,
    required this.createdOn,
    required this.bloodDonationStatus,
    required this.plantATreeStatus,
    required this.wallet,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    ageId: json["age_id"],
    ageName: json["age_name"],
    occupationId: json["occupation_id"],
    nationality: json["nationality"],
    deviceType: json["device_type"],
    deviceToken: json["device_token"],
    loginType: json["login_type"],
    profileImg: json["profile_img"],
    addCommunityPost: json["add_community_post"],
    status: json["status"],
    marriedStatus: json["married_status"],
    farmerId: json["farmer_id"],
    createdOn: json["created_on"],
    bloodDonationStatus: json["blood_donation_status"],
    plantATreeStatus: json["plant_a_tree_status"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "age_id": ageId,
    "age_name": ageName,
    "occupation_id": occupationId,
    "nationality": nationality,
    "device_type": deviceType,
    "device_token": deviceToken,
    "login_type": loginType,
    "profile_img": profileImg,
    "add_community_post": addCommunityPost,
    "status": status,
    "married_status": marriedStatus,
    "farmer_id": farmerId,
    "created_on": createdOn,
    "blood_donation_status": bloodDonationStatus,
    "plant_a_tree_status": plantATreeStatus,
    "wallet": wallet,
  };
}
