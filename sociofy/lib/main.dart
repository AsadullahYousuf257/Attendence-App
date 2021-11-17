import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_ui/mapscreen.dart';
import 'package:new_ui/signup.dart';
import 'package:new_ui/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

// FirebaseUser loggedInUser;

void getCurrentUser() async {}

class _State extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   title: Text('Sample App'),
        // ),

        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 40),
                  child: Image.asset("images/logo.png"),
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
                          child: Icon(Icons.email,
                              size: 20.0, color: Colors.black),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                  child: Container(
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child:
                              Icon(Icons.lock, size: 20.0, color: Colors.black),
                        ),
                        border: OutlineInputBorder(),
                        labelText: ' Password',
                      ),
                    ),
                  ),
                ),
                // FlatButton(
                //   onPressed: () {
                //     //forgot password screen
                //   },
                //   textColor: Colors.blue,
                //   child: Text('Forgot Password'),
                // ),
                Container(
                  height: 70,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text('Login'),
                    onPressed: () async {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      try {
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Mapscreen()),
                          );
                        } else {
                          return null;
                        }
                      } catch (e) {
                        print(e);
                      }
                      print(email);
                      print(password);

                      // print(nameController.text);
                      // print(passwordController.text);
                    },
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Don\'t have an account?'),
                    FlatButton(
                      textColor: Colors.black,
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const signup(),
                          ),
                        );
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

/*
import 'package:flutter/material.dart';
import 'package:new_ui/signup.dart';
import 'package:new_ui/splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

// final _auth = FirebaseAuth.instance;
// FirebaseUser loggedInUser;
//
// void getCurrentUser() async {}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   title: Text('Sample App'),
        // ),

        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 40),
                  child: Image.network(
                      "https://mysociofy.com/wp-content/uploads/2021/09/Untitled-1-02.png"),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign In',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                // FlatButton(
                //   onPressed: () {
                //     //forgot password screen
                //   },
                //   textColor: Colors.blue,
                //   child: Text('Forgot Password'),
                // ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    child: Text('Login'),
                    onPressed: () {
                      print(email);
                      print(password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const signup()),
                      );
                      // print(nameController.text);
                      // print(passwordController.text);
                    },
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.black,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const signup(),
                          ),
                        );
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}*/
