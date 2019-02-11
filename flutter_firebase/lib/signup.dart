import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/home.dart';

class SignUP extends StatefulWidget {
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

   String _email,_pass;
  
   final GlobalKey<FormState> _formState=GlobalKey<FormState>();
   
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
         appBar: AppBar(
           centerTitle: true,
           backgroundColor: Colors.deepOrange,
           title: Text('Sign Up'),
         ),
         body: Padding(
           padding: EdgeInsets.all(16.0),
           child: Form(
             key: _formState,
             child: Column(
               children: <Widget>[
                 TextFormField(
                   validator: (input){
                     if(input.isEmpty){
                       return 'Please provide valid email';
                     }
                   },
                   onSaved: (input)=>_email=input,
                   decoration: InputDecoration(
                     labelText: 'Enter Email',
                   ),
                 ),
                 SizedBox(height: 10.0,),
                 TextFormField(
                   validator: (input){
                     if(input.length<4 && input.length>12){
                       return 'password between 6 and 12';
                     }
                   },
                   onSaved: (input)=>_pass=input,
                   decoration: InputDecoration(
                     labelText: 'Enter Password',
                   ),
                   obscureText: true,
                 ),
                 SizedBox(height: 10.0,),
                 MaterialButton(
                   splashColor: Colors.green,
                   height: 45,
                   minWidth: 150,
                   color: Colors.deepOrange,
                   child: Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 18),),
                   onPressed: (){
                        return signUp();
                   },
                 ),
               ],
             ),
           ),
         ),
       ),
    );
  }
  
  Future<void> signUp() async{

    final formState=_formState.currentState;

    if(formState.validate()){
      formState.save();

      try{
        
        FirebaseUser user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password: _pass);
        
        //pop the previous screen 
        //By doning this we can avoid to navigate in privious page
        //Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(
            
              builder: (context)=>Home(user:user),
         )
        );

      }catch(e){
           
           print(e.message.toString());

      }

    } 
  }
}