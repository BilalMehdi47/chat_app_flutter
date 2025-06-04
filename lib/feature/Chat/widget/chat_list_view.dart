import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Chat/domain/entities/chat_entity.dart';
import 'package:project/feature/Chat/message_view/presentation/message_view.dart';

class ChatListView extends ConsumerWidget {
  final List<ChatEntity> chats;

  const ChatListView({
    super.key,
    required this.chats,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 25,
                  backgroundImage: NetworkImage(chat.partnerProfilePic),
                ),
                title: Text(chat.partnerName),
                subtitle: Text(chat.lastMessage.content),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    // Format timestamp as HH:mm
                    '${chat.lastMessage.createdAt.hour}:${chat.lastMessage.createdAt.minute.toString().padLeft(2, '0')}',
                  ),
                ),
                onTap: () {
                  // Just pass chatGroupId; MessageView will use isSentByUser
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MessageView(
                        chatGroupId: chat.chatGroupId,
                      ),
                    ),
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
