import 'dart:convert';

class MecRequest {
    String requestId;
    String driverName;
    String distance;

    MecRequest({
        required this.requestId,
        required this.driverName,
        required this.distance,
    });

    factory MecRequest.fromJson(Map<String, dynamic> json) => MecRequest(
        requestId: json["request_id"],
        driverName: json["driver_name"],
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "driver_name": driverName,
        "distance": distance,
    };
}

List<MecRequest> mecRequestFromJson(String str) => List<MecRequest>.from(json.decode(str).map((x) => MecRequest.fromJson(x)));

String mecRequestToJson(List<MecRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
