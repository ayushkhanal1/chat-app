import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderid;
  final String senderemail;
  final String message;
  final String receiverid;
  final Timestamp timestamp;
  MessageModel({
    required this.message,
    required this.receiverid,
    required this.senderemail,
    required this.senderid,
    required this.timestamp,
  });
  Map<String, dynamic> tomap() {
    return {
      'message': message,
      'receiverid': receiverid,
      'senderid': senderid,
      'senderemail': senderemail,
      'timestamp': timestamp,
    };
  }
}
