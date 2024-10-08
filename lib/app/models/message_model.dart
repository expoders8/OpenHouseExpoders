import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/firebase_auth_service.dart';

class MessageField {
  static const String isRead = 'isRead';
  static const String lastMessage = 'lastMessage';
}

class Message {
  String? uid;
  String? content;
  String? senderUID;
  String? reciverUID;
  String? lastMessage;
  Timestamp? createAt;
  bool? isRead;

  Message(
      {this.uid,
      this.content,
      this.senderUID,
      this.reciverUID,
      this.lastMessage,
      this.createAt,
      this.isRead});

  Message.fromJson(Map<String, dynamic> json, String id) {
    uid = id;
    content = json["content"];
    senderUID = json["senderUID"];
    reciverUID = json["reciverUID"];
    lastMessage = json["lastMessage"];
    createAt = json["createAt"];
    isRead = json["isRead"];
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "senderUID": senderUID,
      "reciverUID": reciverUID,
      "lastMessage": lastMessage,
      "createAt": createAt,
      "isRead": isRead
    };
  }

  bool get isMe => FirebaseAuthServices().user?.uid == senderUID;
}
