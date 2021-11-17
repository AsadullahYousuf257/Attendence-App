import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_ui/main.dart';
import 'package:new_ui/thankyou.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_ui/wrong.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_ui/navbar.dart';
// final _auth = FirebaseAuth.instance;
//
// void getCurrentUser() async {
//   final user = await _auth.currentUser();
// }

class Select extends StatelessWidget {
  const Select({Key? key}) : super(key: key);

  void main() {}

  @override
  Widget build(BuildContext context) {
    GoogleMapController googleMapController;
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 85,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          "images/dark-blue-blurred-abstract-background-wallpaper-vi.jpg"),
                    )),
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(children: [
                  ListTile(
                    title: Text("Home"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Tasks"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text("Leave"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text(""),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('')),
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.menu),
          // ),
        ),
        body: Column(
          children: [],
        ));
  }
}
