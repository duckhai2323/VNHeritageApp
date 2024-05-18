import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteItem{
  final String? id;
  final String? title;
  final String? image;
  final String? evaluation;
  final DateTime? timestamp;

  FavoriteItem(this.id,this.title,this.image,this.evaluation,this.timestamp);

  factory FavoriteItem.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return FavoriteItem(
      data?['id']??"",
      data?['title']??"",
      data?['image']??"",
      data?['evaluation']??"",
      (data?['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String,dynamic> toFirestore(){
    return {
      "id":id??"",
      "title":title??"",
      "image":image??"",
      "evaluation":evaluation??"",
      'timestamp':timestamp,
    };
  }
}