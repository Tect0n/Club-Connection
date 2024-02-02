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

  @override
  void initState() {
    super.initState();
    currentUser = widget.user1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club Connect'),
        actions: [
            TextButton(
            child: Text('Switch to ' + (currentUser == widget.user1 ? widget.user2 ?? 'Cat' : widget.user1 ?? 'Dog')),
            onPressed: () {
              setState(() {
                currentUser = currentUser == widget.user1 ? widget.user2 : widget.user1;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser1 = message['user'] == widget.user1;
                return Row(
                  mainAxisAlignment: isUser1 ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isUser1 ? Colors.blue : Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['text'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),




          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      messages.add({
                        'user': currentUser,
                        'text': messageController.text,
                      });
                      messageController.clear();
                    });
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