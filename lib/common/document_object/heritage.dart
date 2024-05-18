import 'package:cloud_firestore/cloud_firestore.dart';

class Heritage {
  final String? id;
  final String? title;
  final String? description;
  final List<String> images;
  final String? open;
  final String? address;
  final String? province;
  final String? evaluation;
  final List<String> userlike;

  Heritage(this.id, this.title, this.description, this.images, this.open,this.address,this.province,this.evaluation,this.userlike);

  factory Heritage.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final data = snapshot.data();
    return Heritage(
      data?['id'] ?? "",
      data?['title'] ?? "",
      data?['description'] ?? "",
      List<String>.from(data?['images'] ?? []),
      data?['open']??"",
      data?['address'] ?? "",
      data?['province'] ?? "",
      data?['evaluation'] ?? "",
      List<String>.from(data?['userlike'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'images': List<String>.from(images ?? []),
      'theme': open,
      'last_username':address,
      'last_comment':province,
      'timestamp':evaluation,
      'userlike': List<String>.from(userlike ?? []),
    };
  }
}