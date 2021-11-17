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

class Mapscreen extends StatelessWidget {
  const Mapscreen({Key? key}) : super(key: key);

  void main() {}

  void geolocation() async {}

  // static const longltd = 24.8679 + 67.0835;

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
        title: Center(child: Text('Attendence Screen')),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 400,
            child: GoogleMap(
              mapType: MapType.hybrid,
              onMapCreated: (value) async {
                googleMapController = value;

                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);

                googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 15)));
              },
              initialCameraPosition:
                  CameraPosition(target: LatLng(24.8679, 67.0835), zoom: 15),
              // markers: Set.from(allMarkers),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () async {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                print(position);

                final myCurrentLocation =
                    mp.LatLng(position.latitude, position.longitude);
                final officeLocation =
                    mp.LatLng(24.86798086818047, 67.08342205320002);

                final distance = mp.SphericalUtil.computeDistanceBetween(
                    myCurrentLocation, officeLocation);

                if (distance < 100) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => thankyou(),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => wrong(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 400, 20, 0),
                child: Positioned(
                  top: 500,
                  right: 20,
                  left: 1,
                  child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Image.asset("images/fingerprint_POSTCARD.jpg"),
                  ),
                ),
              ),
              // child: Row(
              //   children: [
              //
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }
}
