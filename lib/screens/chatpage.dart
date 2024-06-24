import 'package:chat_app/methods/auth_methods.dart';
import 'package:chat_app/methods/chat_service/chat_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.receiveremail, required this.receiverid});
  final String receiveremail;
  final String receiverid;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _msgcontroller = TextEditingController();

  final AuthMethods _authservice = AuthMethods();

  final ChatMethods _chatservice = ChatMethods();
  final ScrollController _myscrollcontroller = ScrollController();

  FocusNode myfocusnode = FocusNode();

  @override
  void initState() {
    super.initState();
    myfocusnode.addListener(
      () {
        if (myfocusnode.hasFocus) {
          Future.delayed(const Duration(milliseconds: 500), () => scrolldown());
        }
      },
    );
    Future.delayed(const Duration(milliseconds: 500), () => scrolldown());
  }

  @override
  void dispose() {
    myfocusnode.dispose();
    _msgcontroller.dispose();
    super.dispose();
  }

  void scrolldown() {
    _myscrollcontroller.animateTo(_myscrollcontroller.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void sendmessage() async {
    if (_msgcontroller.text.isNotEmpty) {
      await _chatservice.sendmessage(widget.receiverid, _msgcontroller.text);
      _msgcontroller.clear();
    }
    scrolldown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiveremail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildmsglist(),
          ),
          _inputmsg()
        ],
      ),
    );
  }

  Widget _buildmsglist() {
    String senderid = _authservice.getcurrentuser()!.uid;
    return StreamBuilder(
      stream: _chatservice.getmessages(senderid, widget.receiverid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error....');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading....');
        }
        return ListView(
          controller: _myscrollcontroller,
          children: snapshot.data!.docs
              .map(
                (docs) => _buildmessage(docs),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildmessage(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool iscurrentuser = data['senderid'] == _authservice.getcurrentuser()!.uid;
    Alignment alignn =
        iscurrentuser ? Alignment.centerRight : Alignment.centerLeft;
    Color msgcolor = iscurrentuser ? Colors.green : Colors.grey;
    return Container(
      margin: const EdgeInsets.all(8),
      alignment: alignn,
      child: Container(
        decoration: BoxDecoration(
          color: msgcolor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          data['message'],
        ),
      ),
    );
  }

  Widget _inputmsg() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: myfocusnode,
              controller: _msgcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'type a message...',
                hintStyle: TextStyle(
                  color: Color.fromARGB(53, 27, 26, 26),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.only(right: 2),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            child: IconButton(
              onPressed: sendmessage,
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
