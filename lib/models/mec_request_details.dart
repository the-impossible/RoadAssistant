import 'dart:convert';
import 'dart:typed_data';

class MecRequestDetail {
    String requestId;
    bool pending;
    bool approved;
    DateTime dateRequested;
    String driverName;
    String driverPhone;
    String distance;
  Uint8List image;

    MecRequestDetail({
        required this.requestId,
        required this.pending,
        required this.approved,
        required this.dateRequested,
        required this.driverName,
        required this.driverPhone,
        required this.distance,
        required this.image,
    });

    factory MecRequestDetail.fromJson(Map<String, dynamic> json) => MecRequestDetail(
        requestId: json["request_id"],
        pending: json["pending"],
        approved: json["approved"],
        dateRequested: DateTime.parse(json["date_requested"]),
        driverName: json["driver_name"],
        driverPhone: json["driver_phone"],
        distance: json["distance"],
        image: base64Decode(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "pending": pending,
        "approved": approved,
        "date_requested": dateRequested.toIso8601String(),
        "driver_name": driverName,
        "driver_phone": driverPhone,
        "distance": distance,
        "image": base64Encode(image),
    };
}


MecRequestDetail mecRequestDetailFromJson(String str) => MecRequestDetail.fromJson(json.decode(str));

String mecRequestDetailToJson(MecRequestDetail data) => json.encode(data.toJson());

