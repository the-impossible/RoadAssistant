// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

class UserProfile {
  String email;
  String name;
  String phone;
  bool is_mec;
  Uint8List image;

  UserProfile({
    required this.email,
    required this.name,
    required this.phone,
    required this.is_mec,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json["email"],
      name: json["name"],
      phone: json["phone"],
      is_mec: json["is_mec"],
      image: base64Decode(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "phone": phone,
        "is_mec": is_mec,
        "image": base64Encode(image),
      };
}

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());
