import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String? id;
  final String? title;
  final String? content;
  final List<String> images;
  final String? user_id;
  final String? heritage_id;
  final String? last_username;
  final String? last_comment;
  final List<String> userlike;
  final DateTime? timestamp;

  Blog(this.id, this.title, this.content, this.images, this.user_id,this.heritage_id,this.last_username,this.last_comment,this.userlike,this.timestamp);

  factory Blog.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final data = snapshot.data();
    return Blog(
      data?['id'] ?? "",
      data?['title'] ?? "",
      data?['content'] ?? "",
      List<String>.from(data?['images'] ?? []),
      data?['user_id']??"",
      data?['heritage_id']??"",
      data?['last_username'] ?? "",
      data?['last_comment'] ?? "",
      List<String>.from(data?['userlike'] ?? []),
      (data?['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'images': List<String>.from(images ?? []),
      'user_id': user_id,
      'heritage_id': heritage_id,
      'last_username':last_username,
      'last_comment':last_comment,
      'userlike': List<String>.from(userlike ?? []),
      'timestamp':timestamp,
    };
  }
}