import 'package:flutter/material.dart';
import 'package:yiriwa_dashboard/Screens/dashboardScreen.dart';

class userAdmin extends StatefulWidget {
  const userAdmin({Key? key}) : super(key: key);

  @override
  _userAdminState createState() => _userAdminState();
}

class _userAdminState extends State<userAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sideBar(),
            Expanded(
              flex: 5,
              child: dashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class sideBar extends StatelessWidget {
  const sideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/icons/Logo2.png'),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 30,
                  child: Image.asset('assets/icons/Logo2.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "SIDIBE SOULEYMANE",
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.dashboard,
                color: Colors.white54,
              ),
              title: const Text(
                "Dashboard",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.admin_panel_settings,
                color: Colors.white54,
              ),
              title: const Text(
                "Admin",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.admin_panel_settings,
                color: Colors.white54,
              ),
              title: const Text(
                "Experts",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.admin_panel_settings,
                color: Colors.white54,
              ),
              title: const Text(
                "Entrepreneurs",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            ListTile(
              onTap: () {},
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.admin_panel_settings,
                color: Colors.white54,
              ),
              title: const Text(
                "Investiseurs",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
