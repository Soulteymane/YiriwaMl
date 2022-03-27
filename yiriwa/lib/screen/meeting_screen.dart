import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yiriwa/responsive/mobile_screen.dart';

import 'package:yiriwa/screen/video_call_screen.dart';
import 'package:yiriwa/service/jitsi_meet_methods.dart';
import 'package:yiriwa/utils/colors.dart';
import 'package:yiriwa/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => VideoCallScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Visioconférence"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (builder) => mobileScreenLayout()),
                (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HommeMeetingButton(
                onPressed: createNewMeeting,
                text: 'Conférence',
                icon: Icons.videocam,
              ),
              HommeMeetingButton(
                onPressed: () => joinMeeting(context),
                text: 'Rejoindre',
                icon: Icons.add_box_rounded,
              ),
              HommeMeetingButton(
                onPressed: () {},
                text: 'Agenda',
                icon: Icons.calendar_today,
              ),
              HommeMeetingButton(
                onPressed: () {},
                text: "Partage d'ecran",
                icon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
          Expanded(
            child: Center(
                child: Container(
              child: Image.asset("assets/images/ggggggg.png"),
            )),
          ),
        ],
      ),
    );
  }
}
