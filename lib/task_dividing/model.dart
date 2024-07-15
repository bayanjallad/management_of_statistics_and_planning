
import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) => List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  String message;
  bool? isMe;

  ChatModel({
    required this.message,
     this.isMe,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    message: json["message"],
    isMe: json["is_me"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "is_me": isMe,
  };
}
