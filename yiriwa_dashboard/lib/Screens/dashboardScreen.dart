// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:yiriwa_dashboard/Screens/components/header.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 500,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 500,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
