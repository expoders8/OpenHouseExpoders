import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class UserField {
  static const String name = 'name';
  static const String image = 'image';
  static const String lastMessage = 'lastMessage';
  static const String lastMessageTime = 'lastMessageTime';
  static const Object unreadCount = 'unreadCount';
}

class FirebaseUser {
  String? name;
  String? email;
  String? image;
  String? uid;
  String? orgId;
  String? lastMessage;
  Timestamp? lastMessageTime;

  FirebaseUser({
    this.name,
    this.email,
    this.image,
    this.uid,
    this.orgId,
    this.lastMessage,
    this.lastMessageTime,
  });

  FirebaseUser.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    image = json["image"];
    uid = json["uid"];
    orgId = json["orgId"];
    lastMessage = json["lastMessage"];
    lastMessageTime = json["lastMessageTime"];
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "image": image,
      "name": name,
      "orgId": orgId,
      "lastMessage": lastMessage,
      "lastMessageTime": lastMessageTime
    };
  }
}

class FirebaseUserModel {
  var msgCollection = FirebaseFirestore.instance.collection("messages");

  String? name;
  String? email;
  String? image;
  String? uid;
  String? orgId;
  String? lastMessage;
  Timestamp? lastMessageTime;
  dynamic unreadCount;

  FirebaseUserModel({
    this.name,
    this.email,
    this.image,
    this.uid,
    this.orgId,
    this.lastMessage,
    this.lastMessageTime,
    this.unreadCount,
  });

  FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    image = json["image"];
    uid = json["uid"];
    orgId = json["orgId"];
    lastMessage = json["lastMessage"];
    lastMessageTime = json["lastMessageTime"];
    unreadCount = json["unreadCount"];
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "image": image,
      "name": name,
      "orgId": orgId,
      "lastMessage": lastMessage,
      "lastMessageTime": lastMessageTime,
      "unreadCount": unreadCount
    };
  }
}