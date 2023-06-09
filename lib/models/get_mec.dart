import 'dart:convert';
import 'dart:typed_data';

class GetMec {
  String userId;
  String email;
  String name;
  String phone;
  bool is_mec;
  String bizName;
  String shopAddress;
  String lat;
  String lon;
  String distance;
  Uint8List image;

  GetMec({
    required this.userId,
    required this.email,
    required this.name,
    required this.phone,
    required this.is_mec,
    required this.bizName,
    required this.shopAddress,
    required this.lat,
    required this.lon,
    required this.distance,
    required this.image,
  });

  factory GetMec.fromJson(Map<String, dynamic> json) => GetMec(
        userId: json["user_id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        is_mec: json["is_mec"],
        bizName: json["biz_name"],
        shopAddress: json["shop_address"],
        lat: json["lat"],
        lon: json["lon"],
        distance: json["distance"],
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
        "distance": distance,
        "image": base64Encode(image),
      };
}

GetMec getMecFromJson(String str) => GetMec.fromJson(json.decode(str));

String getMecToJson(GetMec data) => json.encode(data.toJson());
