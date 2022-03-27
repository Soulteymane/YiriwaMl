import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:yiriwa/service/Auth_Service.dart';
import 'package:yiriwa/service/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:yiriwa/model/user.dart' as model;

class JitsiMeetMethods {
  final AuthClass _authMethods = AuthClass();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStoreMethods _firestoreMethods = FireStoreMethods();
  var userData = {};

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      User currentUser = _auth.currentUser!;
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      userData = userSnap.data()!;
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;

      if (username.isEmpty) {
        name = userData["username"];
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = userData["email"]
        ..userAvatarURL = userData["photo"]
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
