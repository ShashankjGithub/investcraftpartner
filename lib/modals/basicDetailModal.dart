// To parse this JSON data, do
//
//     final baicDetailModal = baicDetailModalFromJson(jsonString);

import 'dart:convert';

BaicDetailModal baicDetailModalFromJson(String str) => BaicDetailModal.fromJson(json.decode(str));

String baicDetailModalToJson(BaicDetailModal data) => json.encode(data.toJson());

class BaicDetailModal {
  String status;
  List<Message> message;

  BaicDetailModal({
    required this.status,
    required this.message,
  });

  factory BaicDetailModal.fromJson(Map<String, dynamic> json) => BaicDetailModal(
    status: json["status"],
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  dynamic name;
  dynamic email;
  dynamic mobile;

  Message({
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
  };
}
