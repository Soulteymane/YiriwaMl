import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yiriwa/screen/CloudFirestoreSearch.dart';
import 'package:yiriwa/screen/acceuil.dart';
import 'package:yiriwa/screen/add_post_screen.dart';
import 'package:yiriwa/screen/categories.dart';
import 'package:yiriwa/screen/connexion.dart';

import 'package:yiriwa/screen/inscription.dart';
import 'package:yiriwa/screen/profile_screen.dart';
import 'package:yiriwa/screen/test.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const acceuil(),
  CloudFirestoreSearch(),
  Text("data"),
  //  AddPostScreen(uid: FirebaseAuth.instance.currentUser!.uid),
  categoriesScreen(),
  Text("data"),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // )
];
