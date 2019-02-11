import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/home.dart';
import 'package:flutter_firebase/login.dart';
import 'package:flutter_firebase/signup.dart';

class LandingPage extends StatefulWidget {
  _LandingPageState createState() => _LandingPageState();
}


class _LandingPageState extends State<LandingPage> {

  
  //If user already logged in then it will navigate to home page
  @override
  void setState(fn) {
    //var currentUser=FirebaseAuth.instance.currentUser();
   
     FirebaseAuth.instance.onAuthStateChanged.listen((firebaseUser) {
     
     if(firebaseUser!=null){
        
        Navigator.push(
        context,
         MaterialPageRoute(
           builder: (context)=> Home(),
          )
       );

     }
    });

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         body:Padding(
           padding: EdgeInsets.all(16.0),
           child: Center (
              child: Column(
               children: <Widget>[
                 Image.asset('assets/daisy_fuchsia.png',height: 400,width: 800,),
                 Row(
                   children: <Widget>[
                        MaterialButton(
                          splashColor: Colors.green,
                   height: 45,
                   minWidth: 150,
                   color: Colors.deepOrange,
                   onPressed: (){
                     Navigator.push(context,MaterialPageRoute(
                         builder: (context)=> SignUP()
                         )
                      );
                   },
                   child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 18),),
                 ),
                 SizedBox(
                   width: 10.0,
                 ),
                 MaterialButton(
                   splashColor: Colors.green,
                   height: 45,
                   minWidth: 150,
                   color: Colors.deepOrange,
                   onPressed: (){
                     
                     //Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context)=> LoginPage(),
                      )
                    );
                   },
                   child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 18)),
                   ),
                   ],
                 ),
                 
               ],
             ),
           )
         ),
       ),
    );
  }

  
}