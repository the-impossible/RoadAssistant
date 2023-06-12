import 'dart:convert';
import 'dart:typed_data';

class RequestDetails {
  String requestId;
  bool pending;
  bool approved;
  DateTime dateRequested;
  String bizName;
  String distance;
  Uint8List image;
  String shopAddress;

  RequestDetails({
    required this.requestId,
    required this.pending,
    required this.approved,
    required this.dateRequested,
    required this.bizName,
    required this.distance,
    required this.image,
    required this.shopAddress,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) => RequestDetails(
        requestId: json["request_id"],
        pending: json["pending"],
        approved: json["approved"],
        dateRequested: DateTime.parse(json["date_requested"]),
        bizName: json["biz_name"],
        distance: json["distance"],
        image: base64Decode(json["image"]),
        shopAddress: json["shop_address"],
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "pending": pending,
        "approved": approved,
        "date_requested": dateRequested.toIso8601String(),
        "biz_name": bizName,
        "distance": distance,
        "image": base64Encode(image),
        "shop_address": shopAddress,
      };
}

RequestDetails requestDetailsFromJson(String str) =>
    RequestDetails.fromJson(json.decode(str));

String requestDetailsToJson(RequestDetails data) => json.encode(data.toJson());
