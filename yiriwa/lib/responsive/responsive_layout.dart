import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yiriwa/providers/user_providers.dart';

import 'package:yiriwa/utils/global_variable.dart';

class ResponveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  _ResponveLayoutState createState() => _ResponveLayoutState();
}

class _ResponveLayoutState extends State<ResponveLayout> {
  @override
  void iniState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webScreenLayout;
          //web
        }
        //mobile
        return widget.mobileScreenLayout;
      },
    );
  }
}
