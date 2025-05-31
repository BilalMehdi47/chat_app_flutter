import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final ChatMessage msg;
  const MessageWidget(this.msg, {super.key});

  @override
  Widget build(BuildContext c) {
    final align = msg.isMe ? Alignment.centerRight : Alignment.centerLeft;
    final color = msg.isMe ? Colors.indigoAccent : Colors.white;
    final radius = msg.isMe
        ? BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16))
        : BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16));
    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: radius,
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            color: msg.isMe ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  ChatMessage(this.text, this.isMe);
}

