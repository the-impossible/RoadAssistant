import 'dart:convert';

class DriverHistory {
    String requestId;
    String bizName;
    String distance;

    DriverHistory({
        required this.requestId,
        required this.bizName,
        required this.distance,
    });

    factory DriverHistory.fromJson(Map<String, dynamic> json) => DriverHistory(
        requestId: json["request_id"],
        bizName: json["biz_name"],
        distance: json["distance"],
    );

    Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "biz_name": bizName,
        "distance": distance,
    };
}

List<DriverHistory> driverHistoryFromJson(String str) => List<DriverHistory>.from(json.decode(str).map((x) => DriverHistory.fromJson(x)));

String driverHistoryToJson(List<DriverHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));