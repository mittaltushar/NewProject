// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
    Payload payload;
    String message;
    String devMessage;
    String type;
    int code;

    LoginData({
        required this.payload,
        required this.message,
        required this.devMessage,
        required this.type,
        required this.code,
    });

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
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
    String occupationId;
    String nationality;
    String deviceType;
    String deviceToken;
    String loginType;
    String profileImg;
    String addCommunityPost;
    String status;
    String createdOn;
    String authToken;

    Payload({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.ageId,
        required this.occupationId,
        required this.nationality,
        required this.deviceType,
        required this.deviceToken,
        required this.loginType,
        required this.profileImg,
        required this.addCommunityPost,
        required this.status,
        required this.createdOn,
        required this.authToken,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        ageId: json["age_id"],
        occupationId: json["occupation_id"],
        nationality: json["nationality"],
        deviceType: json["device_type"],
        deviceToken: json["device_token"],
        loginType: json["login_type"],
        profileImg: json["profile_img"],
        addCommunityPost: json["add_community_post"],
        status: json["status"],
        createdOn: json["created_on"],
        authToken: json["auth_token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "age_id": ageId,
        "occupation_id": occupationId,
        "nationality": nationality,
        "device_type": deviceType,
        "device_token": deviceToken,
        "login_type": loginType,
        "profile_img": profileImg,
        "add_community_post": addCommunityPost,
        "status": status,
        "created_on": createdOn,
        "auth_token": authToken,
    };
}
