import 'package:chat_app/methods/auth_methods.dart';
import 'package:chat_app/methods/chat_service/chat_methods.dart';
import 'package:chat_app/screens/chatpage.dart';
import 'package:chat_app/widgets/mydrawer.dart';
import 'package:chat_app/widgets/usertile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ChatMethods _chatmethods = ChatMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: const SideDrawer(),
      body: StreamBuilder(
        stream: _chatmethods.getuserstream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                  (userdata) => _builduserlistitem(userdata, context),
                )
                .toList(),
          );
        },
      ),
    );
  }

  Widget _builduserlistitem(
      Map<String, dynamic> userdata, BuildContext context) {
    if (userdata['email'] != AuthMethods().getcurrentuser()!.email) {
      return UserTile(
        ontap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiveremail: userdata['email'],
                receiverid: userdata['uid'],
              ),
            ),
          );
        },
        text: userdata['email'],
      );
    } else {
      return Container();
    }
  }
}
