import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String? id_blog;
  final String? id_user;
  final String? title;
  final String? username;
  final String? userimage;
  final DateTime? timestamp;

  Comment(this.id_blog, this.id_user, this.title, this.username, this.userimage,
      this.timestamp);

  factory Comment.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Comment(
      data?['id_blog'] ?? "",
      data?['id_user'] ?? "",
      data?['title'] ?? "",
      data?['username'] ?? "",
      data?['userimage'] ?? "",
      (data?['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id_blog': id_blog,
      'id_user': id_user,
      'title': title,
      'username': username,
      'userimage': userimage,
      'timestamp': timestamp,
    };
  }
}
