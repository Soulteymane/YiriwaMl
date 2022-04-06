import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:admin/service/storage_methode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  final Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  //Delete User
  CollectionReference user = FirebaseFirestore.instance.collection('users');
  Future<void> deleteUser(id) {
    return user
        .doc(id)
        .delete()
        .then((value) => print("User Delete"))
        .catchError((Error) => print('pas supprimé: $Error'));
  }

  RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Errroooorrr');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List userDocs = [];
          snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
            Map a = documentSnapshot.data() as Map<String, dynamic>;
            userDocs.add(a);
            a['id'] = documentSnapshot.id;
          }).toList();
          return Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Liste des utilisateurs",
                  style: TextStyle(color: Colors.teal),
                ),

                SizedBox(
                  height: 20,
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Center(
                          child: Text(
                            "Nom d'utilisateur",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text("Email",
                              style: TextStyle(color: Colors.teal)),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Role',
                              style: TextStyle(color: Colors.teal)),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('Action',
                              style: TextStyle(color: Colors.teal)),
                        ),
                      ),
                    ]),
                    for (var i = 0; i < userDocs.length; i++) ...[]
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Table(
                  border: TableBorder.all(color: Colors.teal),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    for (var i = 0; i < userDocs.length; i++) ...[
                      TableRow(children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              userDocs[i]['username'],
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              userDocs[i]['email'],
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              userDocs[i]['role'],
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteUser(userDocs[i]['id']);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ]
                  ],
                )

                // SizedBox(
                //   width: double.infinity,
                //   child: DataTable2(
                //     columnSpacing: defaultPadding,
                //     minWidth: 600,
                //     columns: [
                //       DataColumn(
                //         label: Text("Nom d'utilisateur"),
                //       ),
                //       DataColumn(
                //         label: Text("Email"),
                //       ),
                //       DataColumn(
                //         label: Text("Role"),
                //       ),
                //     ],
                //     rows: List.generate(
                //       demoRecentFiles.length,
                //       (index) => recentFileDataRow(demoRecentFiles[index]),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        });
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
