import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      // title: "Tutorial",
      home: thankyou(),
    ));
final fourHoursFromNow = DateTime.now();

class thankyou extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<thankyou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        // title: Text("Dropdown Button"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
                child: Column(
              children: [
                Image.asset("images/LODING-01.jpg"),
                Text(DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
