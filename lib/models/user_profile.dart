// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

class UserProfile {
  String userId;
  String email;
  String name;
  String phone;
  bool is_mec;
  dynamic bizName;
  dynamic shopAddress;
  dynamic lat;
  dynamic lon;
  Uint8List image;

  UserProfile({
    required this.userId,
    required this.email,
    required this.name,
    required this.phone,
    required this.is_mec,
    this.bizName,
    this.shopAddress,
    this.lat,
    this.lon,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userId: json["user_id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        is_mec: json["is_mec"],
        bizName: json["biz_name"],
        shopAddress: json["shop_address"],
        lat: json["lat"],
        lon: json["lon"],
        image: base64Decode(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "name": name,
        "phone": phone,
        "is_mec": is_mec,
        "biz_name": bizName,
        "shop_address": shopAddress,
        "lat": lat,
        "lon": lon,
        "image": base64Encode(image),
      };
}

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());
