import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:slam/widgets/grey_background.dart';

import '../bottom_navigation_bar/bottom_nav_bar.dart';
import '../utils/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: greyBackgroundImage(
      mainWidget: Padding(
        padding: EdgeInsets.only(
          left: size.height * 0.015,
          right: size.height * 0.015,
          top: size.height * 0.015,
          bottom: size.height * 0.015,
        ),
        child: Stack(
          children: [
            Positioned(
              height: 90,
              top: 30,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyBottomNavBar()));
                          },
                          icon: const Icon(IconlyBold.arrow_left,
                              color: Colors.white),
                        ),
                        const Text(
                          'Make A Report',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 36),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  const Text(
                    'A report on Sexual Harassment',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: size.height * 0.006),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0, top: 124.0),
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message.sender == MessageSender.user;

                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(14, 4, 14, 10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[100] : Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: isUser
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            isUser ? 'User' : 'Admin',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                          Text(message.text),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            prefixIcon: Icon(Icons.emoji_emotions),
                            hintText: 'Message',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ),
                          // maxLines: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue[900],
                        radius: 25,
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            final text = _messageController.text;
                            if (text.isNotEmpty) {
                              setState(() {
                                _messages.add(Message(
                                    text: text, sender: MessageSender.user));
                                _messages.add(Message(
                                    text: 'Response from Admin',
                                    sender: MessageSender
                                        .admin)); // Simulating doctor's response
                                _messageController.clear();
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
