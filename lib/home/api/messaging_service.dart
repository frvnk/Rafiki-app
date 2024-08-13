import 'package:cloud_firestore/cloud_firestore.dart';

class MessagingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String doctorId, String userId, String message) async {
    await _firestore.collection('messages').add({
      'doctorId': doctorId,
      'userId': userId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

// Optionally, add methods for fetching messages, etc.
}
