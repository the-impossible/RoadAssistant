import 'dart:convert';
import 'dart:typed_data';

class UserProfile {
  String email;
  String name;
  dynamic phone;
  bool isMec;
  Uint8List image;

  UserProfile({
    required this.email,
    required this.name,
    required this.phone,
    required this.isMec,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      email: json["email"],
      name: json["name"],
      phone: json["phone"],
      isMec: json["isMec"],
      image: base64Decode(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "phone": phone,
        "isMec": isMec,
        "image": base64Encode(image),
      };
}

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());
