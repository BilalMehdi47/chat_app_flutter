import 'package:flutter/material.dart';
import 'package:project/feature/app/costants/app_images/app_images.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Card background color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      // blurRadius: 5, // Blur radius
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius: 25,
                              child: IconButton(
                                icon: Icon(Icons.person, size: 25),
                                onPressed: () {},
                              ),
                            ),
                            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                            title: Text("User"),
                            subtitle: Text("tap here for account info"),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 650,
                      decoration: BoxDecoration(
                        color: Colors.white, // Card background color
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 5, // Blur radius
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              AppImages.chatBackground, // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.add_outlined, color: Colors.indigo, size: 30),
                    SizedBox(width: 5),
                    Icon(Icons.camera_alt_outlined, color: Colors.indigo, size: 25),
                    SizedBox(width: 10),
                    Container(
                      height: 35,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'message',
                          contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.send, color: Colors.indigo, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
