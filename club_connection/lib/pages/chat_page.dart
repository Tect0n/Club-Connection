// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  String? user1;
  String? user2;

  ChatPage({Key? key, this.user1, this.user2}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> messages = [];
  late String? currentUser;
  final messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // Step 1

  @override
  void initState() {
    super.initState();
    currentUser = widget.user1;
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the ScrollController
    super.dispose();
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text(
            widget.user2 ?? 'Cat',
            style: TextStyle(
              color: Color.fromARGB(176, 233, 25, 25),
            ),
          ),
          Spacer(),
          TextButton(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Switch to ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: currentUser == widget.user1
                        ? widget.user2 ?? 'Cat'
                        : widget.user1 ?? 'Dog',
                    style: TextStyle(
                        color: currentUser == widget.user1
                            ? Color.fromARGB(176, 233, 25, 25)
                            : Colors.deepPurple),
                  ),
                ],
              ),
            ),
            onPressed: () {
              setState(() {
                currentUser =
                    currentUser == widget.user1 ? widget.user2 : widget.user1;
              });
            },
          ),
          Spacer(),
          Text(
            widget.user1 ?? 'Dog',
            style: TextStyle(color: Colors.deepPurple),
          ),
        ]),
      ),

      // Messages
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller:
                  _scrollController, // Step 2: Assign the ScrollController
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser1 = message['user'] == widget.user1;
                return Row(
                  mainAxisAlignment:
                      isUser1 ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16), // Adjust padding
                      margin:
                          EdgeInsets.symmetric(vertical: 4), // Adjust margin
                      constraints:
                          BoxConstraints(maxWidth: 300), // Adjust maxWidth
                      decoration: BoxDecoration(
                        color: isUser1
                            ? Colors.deepPurple
                            : Color.fromARGB(176, 233, 25, 25),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['text'],
                        style: TextStyle(color: Colors.white),
                        softWrap: true, // Add softWrap
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Message input field
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: messageController,
                      cursorColor: currentUser == widget.user1
                          ? Colors.deepPurple
                          : Color.fromARGB(176, 233, 25, 25),
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: currentUser == widget.user1
                                  ? Colors.deepPurple
                                  : Color.fromARGB(176, 233, 25, 25),
                              width: 2.0),
                        ),
                      )),
                ),

                // Send button
                ValueListenableBuilder(
                  valueListenable: messageController,
                  builder: (BuildContext context, TextEditingValue value,
                      Widget? child) {
                    return IconButton(
                      icon: Icon(Icons.send),
                      color: value.text.isNotEmpty
                          ? (currentUser == widget.user1
                              ? Colors.deepPurple
                              : Color.fromARGB(176, 233, 25, 25))
                          : Colors.grey,
                      onPressed: value.text.isNotEmpty
                          ? () {
                              setState(() {
                                messages.add({
                                  'user': currentUser,
                                  'text': messageController.text,
                                });
                                messageController.clear();
                                scrollToBottom(); // Scroll to bottom
                              });
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
