import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  final String? id;
  final String? name;
  final List<String> images;
  final String? open;
  final String? address;
  final String? province;
  final String? evaluation;
  final String? restaurant;

  Food(this.id, this.name, this.images, this.open, this.address, this.province,
      this.evaluation, this.restaurant);

  factory Food.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Food(
      data?['id'] ?? "",
      data?['name'] ?? "",
      List<String>.from(data?['images'] ?? []),
      data?['open'] ?? "",
      data?['address'] ?? "",
      data?['province'] ?? "",
      data?['evaluation'] ?? "",
      data?['restaurant'] ?? "",
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'images': List<String>.from(images ?? []),
      'theme': open,
      'last_username': address,
      'last_comment': province,
      'evaluation': evaluation,
      'restaurant': restaurant,
    };
  }
}
