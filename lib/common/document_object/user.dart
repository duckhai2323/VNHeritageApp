import 'package:cloud_firestore/cloud_firestore.dart';

class UserClient {
  final String? id;
  final String? fullName;
  final String? email;
  final String? password;
  final String? image;
  final String? birthday;
  final String? numberphone;
  final String? address;

  UserClient(this.id,this.fullName, this.email, this.password,this.birthday,this.numberphone,this.address,{this.image});

  factory UserClient.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return UserClient(
      data?['id']??"",
      data?['fullName']??"",
      data?['email']??"",
      data?['password']??"",
      data?['birthday']??"",
      data?['numberphone']??"",
      data?['address']??"",
      image:data?['image']??"https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%2Fimages%3Fk%3Ddefault%2Bavatar&psig=AOvVaw3ScyMIuG3H_B-DwusNT_X4&ust=1715917623969000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJieuNShkYYDFQAAAAAdAAAAABAE",
    );
  }


  Map<String,dynamic> toFirestore(){
    return {
      "id":id??"",
      "fullName":fullName??"",
      "email":email??"",
      "password":password??"",
      "birthday":birthday??"",
      "numberPhone":numberphone??"",
      "address":address??"",
      "image":image??"",
    };
  }
}