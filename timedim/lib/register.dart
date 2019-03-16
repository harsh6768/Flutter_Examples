import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timedim/dash_board.dart';
import 'package:timedim/login.dart';

class RegisterPage extends StatefulWidget {
  final Widget child;

  RegisterPage({Key key, this.child}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    //to gradient color
                    /*
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF00FF6B), Color(0xFF1FFFE0)],
                    ),
                    */
                    color: Colors.cyan,
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
                          'Sign Up',
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
                    hintText: 'Email',
                  ),
                ),
              ),

              ///
              ///
              //add Notes button
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
                height: 40.0,
              ),
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
                height: 20.0,
              ),
              InkWell(
                //calling function to add the notes into the database
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
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
                height: 86,
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
                    color: Colors.redAccent),
              ),
              Align(
                //for align the text the text
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
