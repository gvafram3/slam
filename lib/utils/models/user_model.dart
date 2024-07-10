import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String username;
  final String password;
  final String email;
  final String photo;
  final int bDay;
  final String currentHostel;
  final int bYear;
  final int bMonth;
  final String gender;
  final String parentPhone;
  final String birthCert;
  final String name;
  final String phoneNumber;
  final String referenceNumber;
  final String fatherName;
  final String motherName;
  final String hometown;
  final String crimeRecords;
  final String role;
  final String otherRecords;
  final String shsAttended;

  UserModel({
    required this.username,
    required this.password,
    required this.email,
    required this.photo,
    required this.bDay,
    required this.currentHostel,
    required this.bYear,
    required this.bMonth,
    required this.gender,
    required this.parentPhone,
    required this.birthCert,
    required this.name,
    required this.phoneNumber,
    required this.referenceNumber,
    required this.fatherName,
    required this.motherName,
    required this.hometown,
    required this.crimeRecords,
    required this.role,
    required this.otherRecords,
    required this.shsAttended,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'email': email,
      'photo': photo,
      'bDay': bDay,
      'currentHostel': currentHostel,
      'bYear': bYear,
      'bMonth': bMonth,
      'gender': gender,
      'parentPhone': parentPhone,
      'birthCert': birthCert,
      'name': name,
      'phoneNumber': phoneNumber,
      'referenceNumber': referenceNumber,
      'fatherName': fatherName,
      'motherName': motherName,
      'hometown': hometown,
      'crimeRecords': crimeRecords,
      'role': role,
      'otherRecords': otherRecords,
      'shsAttended': shsAttended,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      photo: map['photo'] as String,
      bDay: map['bDay'] as int,
      currentHostel: map['currentHostel'] as String,
      bYear: map['bYear'] as int,
      bMonth: map['bMonth'] as int,
      gender: map['gender'] as String,
      parentPhone: map['parentPhone'] as String,
      birthCert: map['birthCert'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      referenceNumber: map['referenceNumber'] as String,
      fatherName: map['fatherName'] as String,
      motherName: map['motherName'] as String,
      hometown: map['hometown'] as String,
      crimeRecords: map['crimeRecords'] as String,
      role: map['role'] as String,
      otherRecords: map['otherRecords'] as String,
      shsAttended: map['shsAttended'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
