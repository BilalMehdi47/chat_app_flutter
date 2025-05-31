import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/app/costants/app_images/app_images.dart';
import 'package:project/feature/Chat/message_view/presentation/widgets/message_widget.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final messages = <ChatMessage>[
    ChatMessage('Hello there!', false),
    ChatMessage('Hi! How are you?', true),
  ];

  @override
  Widget build(BuildContext context) {
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
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 10.w),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 25.r,
                            child: IconButton(
                              icon: Icon(Icons.person, size: 25.sp),
                              onPressed: () {},
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.phone, size: 20.sp),
                          ),
                          title: Text(
                            "User",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "tap here for account info",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  AppImages.chatBackground4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.w),
                                child: ListView.builder(
                                  itemCount: messages.length,
                                  itemBuilder: (_, i) => MessageWidget(messages[i]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: AnimatedPadding(
            duration: Duration(milliseconds: 2),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom,
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
                    offset: Offset(0, 3),
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
                      padding: EdgeInsets.symmetric(horizontal: 12.w,),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.indigo, size: 20.sp),
                    onPressed: () {
                      // send logic
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

  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       resizeToAvoidBottomInset: true,
  //       body: GestureDetector(
  //         behavior: HitTestBehavior.translucent,
  //         onTap: () => FocusScope.of(context).unfocus(),
  //         child: Padding(
  //           padding: EdgeInsets.only(
  //             top: 10.h,
  //             left: 5.w,
  //             right: 5.w,
  //           ),
  //           child: Column(
  //             children: [
  //               Expanded(
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(8.r),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.grey.withOpacity(0.2),
  //                         spreadRadius: 2,
  //                         blurRadius: 5,
  //                         offset: Offset(0, 3),
  //                       ),
  //                     ],
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: ListTile(
  //                               contentPadding: EdgeInsets.only(left: 10.w),
  //                               leading: CircleAvatar(
  //                                 backgroundColor: Colors.grey.shade200,
  //                                 radius: 25.r,
  //                                 child: IconButton(
  //                                   icon: Icon(Icons.person, size: 25.sp),
  //                                   onPressed: () {},
  //                                 ),
  //                               ),
  //                               trailing: IconButton(
  //                                 onPressed: () {},
  //                                 icon: Icon(Icons.phone, size: 20.sp),
  //                               ),
  //                               title: Text(
  //                                 "User",
  //                                 style: TextStyle(fontSize: 16.sp),
  //                               ),
  //                               subtitle: Text(
  //                                 "tap here for account info",
  //                                 style: TextStyle(fontSize: 14.sp),
  //                               ),
  //                               onTap: () {},
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 10.h),
  //                       Expanded(
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius: BorderRadius.circular(8.r),
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: Colors.grey.withOpacity(0.2),
  //                                 spreadRadius: 2,
  //                                 blurRadius: 5,
  //                                 offset: Offset(0, 3),
  //                               ),
  //                             ],
  //                           ),
  //                           child: Stack(
  //                             children: [
  //                               Positioned.fill(
  //                                 child: Image.asset(
  //                                   AppImages.chatBackground4,
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                               ),
  //                               Padding(
  //                                 padding: EdgeInsets.all(12.w),
  //                                 child: ListView.builder(
  //                                   itemCount: messages.length,
  //                                   itemBuilder: (_, i) => MessageWidget(messages[i]),
  //                                 ),
  //                               ),
  //                               SizedBox(height: 5.h),
  //                               Positioned(
  //                                 bottom: 0,
  //                                 left: 0,
  //                                 right: 0,
  //                                 child: Container(
  //                                   padding: EdgeInsets.only(top: 5.h),
  //                                   color: Colors.white,
  //                                   child: Row(
  //                                     children: [
  //                                       Icon(Icons.add, size: 28.sp, color: Colors.indigo),
  //                                       SizedBox(width: 8.w),
  //                                       Icon(Icons.camera_alt, size: 28.sp, color: Colors.indigo),
  //                                       SizedBox(width: 8.w),
  //                                       Expanded(
  //                                         child: Container(
  //                                           padding: EdgeInsets.symmetric(horizontal: 12.w),
  //                                           decoration: BoxDecoration(
  //                                             color: Colors.grey[100],
  //                                             borderRadius: BorderRadius.circular(20.r),
  //                                           ),
  //                                           child: TextField(
  //                                             decoration: InputDecoration(
  //                                               border: InputBorder.none,
  //                                               hintText: 'Message',
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       SizedBox(width: 8.w),
  //                                       IconButton(
  //                                         icon: Icon(Icons.send, color: Colors.indigo, size: 28.sp),
  //                                         onPressed: () {
  //                                           // send logic
  //                                         },
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
// }
