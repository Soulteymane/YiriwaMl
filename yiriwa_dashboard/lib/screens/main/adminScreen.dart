import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../responsive.dart';

class adminSCreen extends StatefulWidget {
  const adminSCreen({Key? key}) : super(key: key);

  @override
  State<adminSCreen> createState() => _adminSCreenState();
}

class _adminSCreenState extends State<adminSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: PageView(
                children: [
                  DashboardScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
