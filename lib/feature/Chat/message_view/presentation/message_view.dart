import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project/app/costants/app_images/app_images.dart';
import 'package:project/feature/Chat/message_view/presentation/widgets/message_widget.dart';
import 'package:project/feature/Chat/message_view/presentation/Riverpod/message_controller.dart';

class MessageView extends ConsumerStatefulWidget {
  final String chatGroupId;
  const MessageView({
    super.key,
    required this.chatGroupId,
  });

  @override
  ConsumerState<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends ConsumerState<MessageView> {
  @override
  void initState() {
    super.initState();
    // Fetch messages for this chatGroupId, using a fixed limit & empty cursor
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(messageControllerProvider.notifier).loadChatDetail(
        chatGroupId: widget.chatGroupId,
        limit: '50',
        cursor: '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the MessageController’s state (AsyncValue<ChatDetailEntity?>)
    final messageState = ref.watch(messageControllerProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
            child: Column(
              children: [
                // Expanded container with header + messages stack
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Header showing partner info (you can replace with dynamic data)
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 10.w),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 25.r,
                            child: IconButton(
                              icon: Icon(Icons.person, size: 25.sp),
                              onPressed: () {
                                // Handle partner profile tap if needed
                              },
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              // Handle “call” action if needed
                            },
                            icon: Icon(Icons.phone, size: 20.sp),
                          ),
                          title: Text(
                            // Optionally show partner name if you have it cached
                            "Chat",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "Tap here for profile info",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          onTap: () {
                            // Navigate to partner’s profile, etc.
                          },
                        ),
                        SizedBox(height: 10.h),

                        // The main “messages” area:
                        Expanded(
                          child: Stack(
                            children: [
                              // 1. Background image
                              Positioned.fill(
                                child: Image.asset(
                                  AppImages.chatBackground4,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // 2. Overlay padding + messages list / loading / error
                              Padding(
                                padding: EdgeInsets.all(12.w),
                                child: messageState.when(
                                  // a) Data has arrived
                                  data: (chatDetail) {
                                    if (chatDetail == null) {
                                      return const Center(
                                        child: Text("No messages loaded."),
                                      );
                                    }

                                    final msgs = chatDetail.messages;
                                    if (msgs.isEmpty) {
                                      return const Center(
                                        child: Text("No messages yet."),
                                      );
                                    }

                                    return ListView.builder(
                                      itemCount: msgs.length,
                                      // Build each MessageWidget using your existing model
                                      itemBuilder: (_, i) {
                                        final m = msgs[i];
                                        // Map MessageEntity → ChatMessage
                                        final chatMsg = ChatMessage(
                                          m.content,
                                          m.isSentByUser,
                                        );
                                        return MessageWidget(chatMsg);
                                      },
                                    );
                                  },

                                  // b) Loading state
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),

                                  // c) Error state
                                  error: (err, _) {
                                    final errMsg =
                                        (err as dynamic).message ??
                                            "Unknown error";
                                    return Center(
                                      child: Text("Error: $errMsg"),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // SizedBox to separate from the input bar
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        // Bottom input bar stays the same as your original
        bottomNavigationBar: SafeArea(
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 2),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                children: [
                  Icon(Icons.add, size: 26.sp, color: Colors.indigo),
                  SizedBox(width: 8.w),
                  Icon(Icons.camera_alt, size: 20.sp, color: Colors.indigo),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message',
                        ),
                        onSubmitted: (text) {
                          // TODO: call send‐message use case (not shown)
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.indigo, size: 20.sp),
                    onPressed: () {
                      // TODO: call send‐message use case
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
