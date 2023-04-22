import 'dart:convert';
import 'dart:typed_data';

class UserProfile {
  int id;
  String name;
  String email;
  String pic;
  bool isMec;
  dynamic phone;
  Uint8List image;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.pic,
    required this.isMec,
    this.phone,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      pic: json["pic"],
      isMec: json["isMec"],
      phone: json["phone"],
      image: base64Decode(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "pic": pic,
        "isMec": isMec,
        "phone": phone,
        "image": base64Encode(image),
      };
}

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

