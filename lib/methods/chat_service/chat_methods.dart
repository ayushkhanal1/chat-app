import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<Map<String, dynamic>>> getuserstream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendmessage(String receiverid, message) async {
    final String currentuserid = _auth.currentUser!.uid;
    final String currentuseremail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    MessageModel newmessage = MessageModel(
        message: message,
        receiverid: receiverid,
        senderemail: currentuseremail,
        senderid: currentuserid,
        timestamp: timestamp);
    List<String> ids = [currentuserid, receiverid];
    ids.sort();
    String chatroomid = ids.join('_');

    await _firestore
        .collection('chatroom')
        .doc(chatroomid)
        .collection('messages')
        .add(
          newmessage.tomap(),
        );
  }

  Stream<QuerySnapshot> getmessages(String userid, String otheruserid) {
    List<String> ids = [userid, otheruserid];
    ids.sort();
    String chatroomid = ids.join('_');
    return _firestore
        .collection('chatroom')
        .doc(chatroomid)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
