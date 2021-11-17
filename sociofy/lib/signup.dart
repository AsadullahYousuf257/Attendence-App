import 'package:flutter/material.dart';
import 'package:new_ui/mapscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  //  String email;
  // String password;
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  State<signup> createState() => _signupState();
}

final _auth = FirebaseAuth.instance;
var text;
var email;
var password;
var contact;
var designation;
var workingHours;

class _signupState extends State<signup> {
  // late String valueChoose;
  // List listitem = [
  //   "Graphic Designer",
  //   "Front-End Developer",
  //   "Digital Marketer"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: Container(
                child: Image.asset("images/logo.png"),
              ),
            ),
            Container(
              child: Text(
                "Register",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    text = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                          Icon(Icons.person, size: 20.0, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: ' Name',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Icon(Icons.email, size: 20.0, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Icon(Icons.lock, size: 20.0, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: ' Password',
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            //   child: Container(
            //     child: TextField(
            //       obscureText: true,
            //       decoration: InputDecoration(
            //         prefixIcon: Padding(
            //           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            //           child: Icon(Icons.lock, size: 20.0, color: Colors.black),
            //         ),
            //         border: OutlineInputBorder(),
            //         labelText: 'Confirm Password',
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextField(
                onChanged: (value) {
                  contact = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // errorText: _validate ? 'Username Can\'t Be Empty' : null,
                  prefixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(Icons.phone, size: 20.0, color: Colors.black),
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  hintText: "Contact",
                ),
              ),
            ),
            // SizedBox(
            //   width: 400,
            //   child: Container(
            //     padding: EdgeInsets.all(20.0),
            //     child: DropdownButton(
            //         // value: _value,
            //         items: [
            //           DropdownMenuItem(
            //             child: Text("Front End Developer"),
            //             value: 1,
            //           ),
            //           DropdownMenuItem(
            //             child: Text("Digital Marketer"),
            //             value: 2,
            //           ),
            //           DropdownMenuItem(
            //               child: Text("Graphic Designer"), value: 3),
            //           DropdownMenuItem(
            //               child: Text("Amazon Marketing"), value: 4)
            //         ],
            //         onChanged: (value) {
            //           setState(() {
            //             // _value = ;
            //           });
            //         }),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    designation = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:
                          Icon(Icons.person, size: 20.0, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Designation',
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                child: TextField(
                  onChanged: (value) {
                    workingHours = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Icon(Icons.lock_clock,
                          size: 20.0, color: Colors.black),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Working Hours',
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            //   child: Container(
            //     child: TextField(
            //       decoration: InputDecoration(
            //         prefixIcon: Padding(
            //           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            //           child: Icon(Icons.calendar_view_day,
            //               size: 20.0, color: Colors.black),
            //         ),
            //         border: OutlineInputBorder(),
            //         labelText: 'Date Of Birth',
            //       ),
            //     ),
            //   ),
            // ),
            Container(
                child: Row(
              children: <Widget>[
                // Text('Does not have account?'),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Mapscreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                        print(text);
                        print(email);
                        print(contact);
                        print(workingHours);
                        print(designation);
                      },
                    ),
                  ),
                  width: 200,
                  height: 80,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
      ),
    );
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('valueChoose', valueChoose));
}
