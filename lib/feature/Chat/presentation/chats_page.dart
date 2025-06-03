// import 'package:flutter/material.dart';
// import 'package:project/feature/Chat/widget/chat_list_view.dart';
// import 'package:project/feature/Chat/widget/search_bar_widget.dart';
//
// class ChatsPage extends StatefulWidget {
//   const ChatsPage({super.key});
//
//   @override
//   State<ChatsPage> createState() => _ChatsPageState();
// }
//
// class _ChatsPageState extends State<ChatsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chats"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add_circle, size: 30, color: Colors.indigo),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.grey.shade200,
//                   radius: 30,
//                   child: IconButton(
//                     icon: Icon(Icons.person, color: Colors.black87, size: 30),
//                     onPressed: () {},
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.edit_outlined),
//                       onPressed: () {
//                         // Handle edit profile
//                       },
//                     ),
//                     SizedBox(width: 5),
//                     IconButton(
//                       icon: const Icon(Icons.camera_alt_outlined),
//                       onPressed: () {
//                         // Handle edit profile
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             SearchBarWidget(),
//             SizedBox(height: 30),
//             Expanded(child: ChatListView()),
//             SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/feature/Chat/presentation/Riverpod/chat_controller.dart';
import 'package:project/feature/Chat/widget/chat_list_view.dart';
import 'package:project/feature/Chat/widget/search_bar_widget.dart';

class ChatsPage extends ConsumerStatefulWidget {
  const ChatsPage({super.key});

  @override
  ConsumerState<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends ConsumerState<ChatsPage> {
  @override
  void initState() {
    super.initState();
    // Only once: trigger loadChats() after widget mounts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatControllerProvider.notifier).loadChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, size: 30, color: Colors.indigo),
            onPressed: () {
              // Handle “start new chat”
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 30,
                  child: IconButton(
                    icon: const Icon(Icons.person, color: Colors.black87, size: 30),
                    onPressed: () {
                      // Handle profile tap
                    },
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
                    const SizedBox(width: 5),
                    IconButton(
                      icon: const Icon(Icons.camera_alt_outlined),
                      onPressed: () {
                        // Handle change avatar
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const SearchBarWidget(),
            const SizedBox(height: 30),

            // React to chatState: loading, data, or error
            Expanded(
              child: chatState.when(
                data: (chats) {
                  if (chats.isEmpty) {
                    return const Center(
                      child: Text(
                        "No chats available.\nStart a conversation now!",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  // Pass the chat list to ChatListView
                  return ChatListView(chats: chats);
                },
                loading: () {
                  return const Center(
                    child: Text(
                      "Loading chats...",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                },
                error: (err, _) {
                  final message = (err as dynamic).message ?? "Unknown error";
                  return Center(child: Text("Error: $message"));
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
