import 'package:flutter/material.dart';
import 'package:yiriwa/screen/CloudFirestoreSearch.dart';
import 'package:yiriwa/screen/EntrepeneurScreen.dart';
import 'package:yiriwa/screen/ExpertScreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Expert/Entrepreneur"),
            centerTitle: true,
            backgroundColor: Colors.teal,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Experts'),
                Tab(
                  text: 'Entrépreneurs',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ExpertScreen(),
            EntrepreneurScreen(),
          ]),
        ));
  }
}
