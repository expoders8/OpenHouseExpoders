import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/firebase_user_model.dart';
import '../../../models/message_model.dart';
import '../components/message_component.dart';
import '../../../services/database_service.dart';
import '../../../../config/constant/constant.dart';
import '../../../../config/constant/font_constant.dart';
import '../../../../config/constant/color_constant.dart';

class ChatScreen extends StatefulWidget {
  final FirebaseUserModel? user;
  const ChatScreen({Key? key, this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String text = "";
  String lastDate = "", userId = "";
  bool show = false;
  bool isSame = false;
  bool sendButton = false;
  bool islisteing = false;
  FocusNode focusNode = FocusNode();
  var msgController = TextEditingController();
  final ScrollController _controller = ScrollController();
  final TextEditingController emojicontroller = TextEditingController();
  var userCollection = FirebaseFirestore.instance.collection("Users");
  var msgCollection = FirebaseFirestore.instance.collection("messages");

  @override
  void initState() {
    getUser();
    msgList();
    super.initState();
  }

  msgList() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);

    var msgLists = await msgCollection
        .where('reciverUID', isEqualTo: getUserData['id'].toString())
        .where('senderUID', isEqualTo: widget.user!.uid)
        .where('isRead', isEqualTo: false)
        .get();
    // .snapshots()
    // .map(
    //     (d) => d.docs.map((e) => Message.fromJson(e.data(), e.id)).toList())
    // .expand((list) => list);

    var msgData = msgLists.docs
        .map((doc) => Message.fromJson(doc.data(), doc.id))
        .toList();
    for (var msg in msgData) {
      msgCollection.doc(msg.uid).update({
        MessageField.isRead: true,
      });
    }
    await userCollection.doc(widget.user!.uid).update({});
  }

  Future getUser() async {
    var data = getStorage.read('user');
    var getUserData = jsonDecode(data);
    if (getUserData != null) {
      setState(() {
        userId = getUserData['id'].toString();
      });
    }
  }

  sendMessageOnClick() async {
    var msg = Message(
      content: msgController.text,
      createAt: Timestamp.now(),
      reciverUID: widget.user!.uid,
      senderUID: userId,
    );
    msgController.clear();
    emojicontroller.clear();
    if (_controller.hasClients) {
      _controller.offset >= 220 ? _scrollDown() : null;
    }
    await DBServices().sendMessage(msg);
    setState(() {
      sendButton = false;
    });
  }

  void _scrollDown() {
    _controller.animateTo(
      0.0,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  bool isAllSpaces(String input) {
    String output = input.replaceAll(' ', '');
    if (output.isNotEmpty) {
      setState(() {
        sendButton = true;
      });
    } else {
      setState(() {
        sendButton = false;
      });
    }
    return output == '';
  }

  // void listen() async {
  //   if (!islisteing) {
  //     bool available = await speechToText.initialize();
  //     if (available) {
  //       setState(() {
  //         islisteing = true;
  //       });
  //       speechToText.listen(
  //         onResult: (result) => setState(
  //           () {
  //             text = result.recognizedWords;
  //             msgController.text = text;
  //             if (text != "") {
  //               setState(() {
  //                 sendButton = true;
  //                 islisteing = false;
  //               });
  //             }
  //           },
  //         ),
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       islisteing = false;
  //     });
  //     speechToText.stop();
  //   }
  // }

  _onBackspacePressed() {
    emojicontroller
      ..text = emojicontroller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: emojicontroller.text.length));
    msgController
      ..text = msgController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: msgController.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          setState(() {
            show = false;
          });
        });
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: kAppBarColor,
          leadingWidth: 60,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Image(
                  image: AssetImage("assets/icons/backicon.png"),
                  width: 20,
                  color: kBackGroundColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: kBackGroundColor,
                size: 28,
              ),
              onPressed: optionTypeBottomSheet,
            ),
          ],
          title: Column(
            children: [
              Text(
                widget.user!.name!,
                style: const TextStyle(fontSize: 18, color: kBackGroundColor),
              ),
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: kDividerColor,
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: DBServices().getMessage(widget.user!.uid!),
                builder: (context, s1) {
                  if (s1.hasData) {
                    return StreamBuilder<List<Message>>(
                      stream: DBServices().getMessage(widget.user!.uid!, true),
                      builder: (context, s2) {
                        if (s2.hasData) {
                          var messages = [...s1.data!, ...s2.data!];
                          messages.sort(
                              (i, j) => i.createAt!.compareTo(j.createAt!));
                          messages = messages.reversed.toList();
                          return messages.isEmpty
                              ? const Center(
                                  child: Text("No Messages"),
                                )
                              : ListView.builder(
                                  controller: _controller,
                                  reverse: true,
                                  itemCount: messages.length,
                                  itemBuilder: (context, index) {
                                    final image = widget.user!.image;
                                    final msg = messages[index];
                                    final date = DateFormat('dd-MM-yyyy')
                                        .format(DateTime.parse(messages[index]
                                            .createAt!
                                            .toDate()
                                            .toString()));
                                    final nextDate = messages.length - 1 >=
                                            index + 1
                                        ? DateFormat('dd-MM-yyyy').format(
                                            DateTime.parse(messages[index + 1]
                                                .createAt!
                                                .toDate()
                                                .toString()))
                                        : '';
                                    isSame = date == nextDate ? true : false;
                                    lastDate = date;

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          !isSame
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                      color: kDividerColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Text(
                                                    date,
                                                    style: const TextStyle(
                                                        color: kBlack54Color,
                                                        fontWeight:
                                                            FontWeight.w200),
                                                  ),
                                                )
                                              : Container(),
                                          !isSame
                                              ? const SizedBox(
                                                  height: 5,
                                                )
                                              : Container(),
                                          MessageComponent(
                                            msg: msg,
                                            image: image,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: kSelectedIconColor));
                        }
                      },
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: kSelectedIconColor));
                  }
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    color: kDividerColor,
                    height: 1.0,
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                  child: TextFormField(
                    controller: msgController,
                    focusNode: focusNode,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    cursorColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        islisteing = false;
                      });
                      isAllSpaces(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.all(5),
                      prefixIcon: IconButton(
                        icon: const Image(
                          image: AssetImage("assets/icons/emoji.png"),
                          width: 22,
                        ),
                        onPressed: () {
                          focusNode.unfocus();
                          focusNode.canRequestFocus = false;
                          setState(() {
                            show = !show;
                          });
                        },
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        onPressed: () async {
                          sendMessageOnClick();
                        },
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  optionTypeBottomSheet() {
    FocusScope.of(context).requestFocus(FocusNode());
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: kWhiteColor,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const Center(
              child: ImageIcon(
                AssetImage("assets/icons/line.png"),
                size: 30,
                color: Color(0XffBFC5CC),
              ),
            ),
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: 70,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ListTile(
                      title: const Center(
                        child: Text(
                          "Delete Chat",
                          style: TextStyle(
                            fontFamily: kWorkSans,
                            fontSize: 15,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      onTap: () async {
                        Navigator.of(context).pop();
                        await DBServices().deleteMessages(widget.user!.uid!);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bottomSheet() {
    FocusScope.of(context).requestFocus(FocusNode());
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
