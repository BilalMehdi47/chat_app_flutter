import 'package:flutter/material.dart';
import 'package:project/feature/Chat/widget/chat_list_view.dart';
import 'package:project/feature/Chat/widget/search_bar_widget.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle, size: 30, color: Colors.indigo),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 30,
                  child: IconButton(
                    icon: Icon(Icons.person, color: Colors.black87, size: 30),
                    onPressed: () {},
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {
                        // Handle edit profile
                      },
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      icon: const Icon(Icons.camera_alt_outlined),
                      onPressed: () {
                        // Handle edit profile
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            SearchBarWidget(),
            SizedBox(height: 30),
            Expanded(child: ChatListView()),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
