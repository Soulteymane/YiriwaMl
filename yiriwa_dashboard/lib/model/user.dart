import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final List abonnes;
  final List abonnement;
  final String activity;

  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.abonnes,
    required this.abonnement,
    required this.activity,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'role': activity,
        'abonnés': [],
        'abonnement': [],
        'photo': photoUrl,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      username: snapshot['username'],
      abonnes: snapshot['abonnés'],
      abonnement: snapshot['abonnement'],
      activity: snapshot['role'],
    );
  }
}
