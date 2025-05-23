import 'package:flutter/material.dart';
import 'package:project/feature/Chat/message_view/presentation/message_view.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 25,
                  child: IconButton(
                    icon: Icon(Icons.person, size: 25),
                    onPressed: () {},
                  ),
                ),
                title: Text('User $index'),
                subtitle: Text('Last Message $index'),
                trailing: Padding(padding: const EdgeInsets.only(right: 15), child: Text('12:12 pm')),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MessageView()),
                  );
                },
              ),
              Divider(thickness: 1, color: Colors.grey[300]),
            ],
          );
        },
      ),
    );
  }
}
