import 'package:flutter/material.dart';

import 'package:yiriwa/utils/utils.dart';

import '../utils.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final String uid;
  final String photoUrl;
  final String username;
  final String message;
  final DateTime? createdAt;

  const Message({
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.message,
    required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        uid: json['uid'],
        photoUrl: json['urlAvatar'],
        username: json['username'],
        message: json['message'],
        createdAt: Utils.toDateTime(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': uid,
        'urlAvatar': photoUrl,
        'username': username,
        'message': message,
        'createdAt': Utils.fromDateTimeToJson(createdAt!),
      };
}
