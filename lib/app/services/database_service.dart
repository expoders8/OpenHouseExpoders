import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message_model.dart';
import '../models/firebase_user_model.dart';
import '../../config/constant/constant.dart';

class DBServices {
  var userCollection = FirebaseFirestore.instance.collection("Users");
  var msgCollection = FirebaseFirestore.instance.collection("messages");

  Future<List<Message>> getUnreadMessages(String? reciverUID) async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);

    var unreadMessages = reciverUID != null && reciverUID != ''
        ? await msgCollection
            .where('senderUID', isEqualTo: getUserData['id'].toString())
            .where('reciverUID', isEqualTo: reciverUID)
            .where('isRead', isEqualTo: false)
            .get()
        : await msgCollection
            .where('reciverUID', isEqualTo: getUserData['id'].toString())
            .where('isRead', isEqualTo: false)
            .get(); // Await the Future returned by get()

    // Process the query snapshot and convert it to a list of FirebaseUserModel objects
    var unreadMessagesList = unreadMessages.docs
        .map((doc) => Message.fromJson(doc.data(), doc.id))
        .toList();

    return unreadMessagesList;
  }

  saveUser(FirebaseUser user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Stream<List<FirebaseUser>> getAppUser() {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    return userCollection
        .where('uid', isEqualTo: getUserData['id'].toString())
        .snapshots()
        .map((event) =>
            event.docs.map((e) => FirebaseUser.fromJson(e.data())).toList());
  }

  Stream<List<FirebaseUserModel>> getDiscussionUser(String query) {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    return userCollection
        .where('uid', isNotEqualTo: getUserData['id'].toString())
        .where('type',
            isEqualTo: getUserData['type'] == "host" ? "tenant" : "host")
        .snapshots()
        .map((event) => event.docs
                .map((e) => FirebaseUserModel.fromJson(e.data()))
                .where((element) {
              final nameLower = element.name!.toLowerCase();
              final searchLower = query.toLowerCase();

              return nameLower.contains(searchLower);
            }).toList());
  }
  // Stream<List<FirebaseUserModel>> getDiscussionUser(String query) async* {
  //   var data = getStorage.read('user');
  //   var getUserData = jsonDecode(data);
  //   var orgId = getStorage.read('orgId').toLowerCase() ?? "";
  //   var orgtrim = orgId.trim();
  //   var myUnreadMessages = await getUnreadMessages(null);

  //   var users = userCollection
  //       .where('uid', isNotEqualTo: getUserData['id'].toString())
  //       .snapshots()
  //       .asyncExpand((event) async* {
  //     var userModelList = <FirebaseUserModel>[];
  //     for (var doc in event.docs) {
  //       var userModel = FirebaseUserModel.fromJson(doc.data());
  //       // userModel.unreadCount =
  //       //     myUnreadMessages.where((m) => m.senderUID == userModel.uid).length;
  //       userModelList.add(userModel);
  //     }
  //     yield userModelList
  //         .where((element) =>
  //             element.name!.toLowerCase().contains(query.toLowerCase()) &&
  //             element.orgId == orgtrim)
  //         .toList();
  //   });

  //   await for (var user in users) {
  //     yield user;
  //   }
  // }

  Stream<List<Message>> getMessage(String reciverUID, [bool myMessage = true]) {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    var xx = msgCollection
        .where("senderUID",
            isEqualTo: myMessage ? getUserData['id'].toString() : reciverUID)
        .where("reciverUID",
            isEqualTo: myMessage ? reciverUID : getUserData['id'].toString())
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Message.fromJson(e.data(), e.id)).toList());
    // userCollection.doc(getUserData['id'].toString()).update({
    //   UserField.unreadCount: {reciverUID: 0}
    // });
    return xx;
  }

  Future<bool> sendMessage(Message msg) async {
    try {
      await msgCollection.doc().set(msg.toJson());
      await userCollection.doc(msg.reciverUID).update({
        UserField.lastMessageTime: msg.createAt,
        UserField.lastMessage: msg.content
      });
      await userCollection.doc(msg.senderUID ?? "").update({
        UserField.lastMessageTime: msg.createAt,
        UserField.lastMessage: msg.content
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMessages(String reciverUID) async {
    final refMessages = FirebaseFirestore.instance.collection('messages');
    try {
      var snapshots = await refMessages.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
        await userCollection.doc(reciverUID).update({
          UserField.lastMessageTime: Timestamp.now(),
          UserField.lastMessage: ''
        });
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
