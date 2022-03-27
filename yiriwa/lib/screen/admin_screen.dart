import 'package:flutter/material.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.grey.shade800,
            height: MediaQuery.of(context).size.height,
            width: 250,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/Logo2.png',
                    scale: 12,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Stack(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://s.rfi.fr/media/display/dbf12bbc-10cb-11ea-bd22-005056a99247/w:1280/p:1x1/2019-07-09t185335z_720855894_rc1d861f0d30_rtrmadp_3_people-nicki-minaj_0.jpg'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Nicki Minaj",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Administrateur',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Expert',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Entrepreneur',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Investisseurs',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: const [
                        Icon(
                          Icons.dashboard,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.admin_panel_settings_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.mode_standby_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.mediation_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.mediation_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 40.0,
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Ajouter'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey.shade300,
            width: MediaQuery.of(context).size.width - 250,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 250,
                  height: 60,
                  color: Colors.white,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 250,
                  height: MediaQuery.of(context).size.height - 60,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
