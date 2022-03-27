import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yiriwa/providers/user_providers.dart';
import 'package:yiriwa/model/user.dart' as model;

class testScreen extends StatefulWidget {
  const testScreen({Key? key}) : super(key: key);

  @override
  _testScreenState createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Center(
      child: Text(
        'aaaddaaa',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
