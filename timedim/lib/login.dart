import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timedim/dash_board.dart';
import 'package:timedim/register.dart';

class LoginPage extends StatefulWidget {
  final Widget child;

  LoginPage({Key key, this.child}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    //to make the full screen
    SystemChrome.setEnabledSystemUIOverlays([]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //this container for the text field and the login buttons
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              //
              //for slicing the border and the login text

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    //to gradient color
                    /*
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF00FF6B), Color(0xFF1FFFE0)],
                    ),
                    */
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      // topLeft: Radius.circular(150),
                      //bottomRight: Radius.circular(260),
                      //topRight: Radius.circular(150),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      //for align the text the text
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32, right: 32),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              //for title of the Notes
              //
              //
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 45,
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextField(
                  //a controller which controls the data of the textField
                  controller: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                  ),
                ),
              ),
              //
              //
              //For the Description of the Notes
              //
              //
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 45,
                //to add the margin ,we can also use SizedBox for that
                margin: EdgeInsets.only(top: 32),
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                //to design the Container
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    //to define the shadow of the textField
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextField(
                  controller: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),

              ///
              ///
              //add Notes button
              ///
              //
              InkWell(
                //calling function to add the notes into the database
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Dashboard(),
                    ));
                  });
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                //calling function to add the notes into the database
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => RegisterPage(),
                    ));
                  });
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 123.0,
              ),

              ///
              /// For two bottom lines
              ///
              Align(
                //for align the text the text
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.cyan,
                ),
              ),
              Align(
                //for align the text the text
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
