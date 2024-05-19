import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vnheritage/common/document_object/comment.dart';

class CommentFood extends Comment {
  final List<String>? images;

  CommentFood(String id_blog, String id_user, String title, String username,
      String userimage, DateTime timestamp,
      {this.images})
      : super(id_blog, id_user, title, username, userimage, timestamp);

  factory CommentFood.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return CommentFood(
      data?['id_blog'] ?? "",
      data?['id_user'] ?? "",
      data?['title'] ?? "",
      data?['username'] ?? "",
      data?['userimage'] ?? "",
      (data?['timestamp'] as Timestamp).toDate(),
      images: List<String>.from(data?['images'] ?? []),
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
      'images': List<String>.from(images ?? []),
    };
  }
}
