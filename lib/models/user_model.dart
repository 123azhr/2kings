import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String? userID;
  final String? email;
  final String? password;
  final String? rating;
  final String? services;
  final String? profileImg;
  final String? gender;
  final String? name;
  final String? contact;
  UserModel({
    this.userID,
    this.name,
    this.email,
    this.password,
    this.rating,
    this.services,
    this.profileImg,
    this.gender,
    this.contact,
  });
  factory UserModel.fromMap(
      {required Map<String, dynamic> map, required String userID}) {
    return UserModel(
      userID: userID,
      name: map["user_name"],
      email: map["user_email"],
      rating: map["user_rating"],
      services: map["user_services"],
      profileImg: map["user_profile_img"],
      gender: map["user_gender"],
      contact: map["user_contact"],
      password: map["user_password"],
    );
  }
}
