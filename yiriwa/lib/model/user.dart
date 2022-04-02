import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String entName;
  final String expPro;
  final List abonnes;
  final List abonnement;
  final String activity;
  final DateTime lastMessageTime;
  final String description;

  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.entName,
    required this.expPro,
    required this.abonnes,
    required this.abonnement,
    required this.activity,
    required this.lastMessageTime,
    required this.description,
  });
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'role': activity,
        'abonnés': [],
        'abonnement': [],
        'photo': photoUrl,
        'Entreprise': entName,
        'Experience Pro': expPro,
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
        entName: snapshot['Entreprise'],
        description: snapshot['Description'],
        expPro: snapshot['Experience'],
        lastMessageTime: snapshot['lastMessageTime']);
  }

  User copyWith({
    required String uid,
    required String username,
    required String photoUrl,
    required DateTime lastMessageTime,
    required String email,
    required List abonnes,
    required List abonnement,
    required String activity,
  }) =>
      User(
        uid: uid,
        username: username,
        photoUrl: photoUrl,
        lastMessageTime: lastMessageTime,
        email: email,
        abonnement: abonnement,
        abonnes: abonnes,
        activity: activity,
        entName: entName,
        expPro: expPro,
        description: description,
      );
}
