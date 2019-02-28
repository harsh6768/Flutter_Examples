import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/bottom_navigation_placeholder/placeholder.dart';
import 'package:flutter_firebase/constants/constants.dart';
import 'package:flutter_firebase/landing.dart';


class Home extends StatefulWidget {
     
    //for getting the user data from the LoginPage
    const Home({
     Key key,
     this.user
     }) : super(key: key);

   final FirebaseUser user;
    

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _choice = 0;
  
  //for saving the index value of selected bottomNavigatinItem
  void selectedTab(index) {
    setState(() {
      _choice = index;
    });
  }

  final List<Widget> _selectedItem = [
   PlaceholderWidget(Colors.greenAccent),
   PlaceholderWidget(Colors.blue),
  ];
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         home: Scaffold(
           appBar: AppBar(
             
             backgroundColor: Colors.deepOrange,
             title: Text('Home'),
             actions: <Widget>[
             
             //for Search Button
                IconButton(
                  onPressed: (){
                   // seachSnackbar(context);
                  },
                  icon: Icon(Icons.search,color: Colors.white,),
                ),
                //
                //
                //for popup menu
                 //
                 //
                 PopupMenuButton<String>(
                   onSelected: onMenuSelected,
                   itemBuilder:(context){

                      // returning the list of item
                     return Constants.select.map((String choice){
                       
                       //passing the value
                       onMenuSelected(choice);

                       return PopupMenuItem<String>(
                         value: choice,
                         child: Text(choice),
                       );

                     }).toList(); 
                     
                     }
                   ),

             ],
           ),
           
           //setting the placeHolder Widget
           body: _selectedItem[_choice],


        // For Drawer
        drawer: new Drawer(
            child: userDrawer(),
        ),

        //Bottom Navigation bar 
        bottomNavigationBar: onBottomNavigation(context),
        //flowting action button
        //this attribute will fix the flowting action button into the bottomNavigation bar
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: onFlowting(context),
        
        
        ),
    );
  }


  // Navigation Drawer
  Widget userDrawer(){

    return ListView(
              children: <Widget>[


                new UserAccountsDrawerHeader(

                    accountName: new Text('user name'),
                    accountEmail: new Text(widget.user.email),
                  
                    currentAccountPicture: new GestureDetector(
                      child: new CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        child: new Icon(Icons.person,color: Colors.white,),
                      ),
                    ),
                  
                  decoration: new BoxDecoration(
                    color: Colors.deepOrange,
                  ),
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    title: new Text('Home',style: new TextStyle(color:Colors.deepOrange)),
                    leading: new Icon(Icons.home,color: Colors.lightBlue,),
                  ),
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    title: new Text('Account',style: new TextStyle(color:Colors.deepOrange)),
                    leading: new Icon(Icons.account_circle,color:Colors.lightBlue ,),
                  ),
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    title: new Text('My Orders',style: new TextStyle(color:Colors.deepOrange)),
                    leading: new Icon(Icons.shopping_basket,color: Colors.lightBlue,),
                  ),
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    onTap:(){} ,
                    title: new Text('Cart',style: new TextStyle(color:Colors.deepOrange)),
                    leading: new Icon(Icons.shopping_cart,color: Colors.lightBlue,),
                  ),
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    title: new Text('Favourites',style: new TextStyle(color:Colors.deepOrange)),
                    leading: new Icon(Icons.favorite,color: Colors.lightBlue,),
                  ),
                ),

                // 
                //Divider of drawer
                //
                
                new Divider(
                  color: Colors.red,
                  height: 4.0,
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    title: new Text('Settings',style: new TextStyle(color:Colors.deepOrange)),
                    leading: new Icon(Icons.settings,color: Colors.lightBlue,),
                  ),
                ),
                new InkWell(
                  onTap: (){},
                  child: new ListTile(
                    title: new Text('Help',style: new TextStyle(color:Colors.deepOrange),),
                    leading: new Icon(Icons.help,color: Colors.lightBlue,),
                  ),
                ),
                 //
                 ///
                 ///
                 ///
                 ///
                // Logout from Account
                ///
                ///
                ///
                new InkWell(
                  onTap: (){
                    
                    FirebaseAuth.instance.signOut();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>LandingPage(),
                      )
                      );
                  },
                  child: new ListTile(
                    title: new Text('Sign out',style: new TextStyle(color:Colors.deepOrange),),
                    leading: new Icon(Icons.exit_to_app,color: Colors.lightBlue,),
                  ),
                  ///
                  ///
                  ///
                  ///
                ),
              ],
            );

  }

   //When we select any Popup Menu
  void onMenuSelected(String choice){

       if(choice==Constants.aboutUs){
          
          print("About Us");

       }else if(choice==Constants.settings){

         print('Settings');      

       }
    
  }

  //for search Snackbar
  void seachSnackbar(BuildContext context){
                    //showing SnackBar
          final snackBar = SnackBar(
            backgroundColor: Colors.green,
            content: Text('Search Items'),
            action: SnackBarAction(
             label: 'Undo',
             onPressed: () {
               
             },
             ),
            );

          Scaffold.of(context).showSnackBar(snackBar);

  }

  //for bottom navigationbar 
  Widget onBottomNavigation(BuildContext context){

        return BottomNavigationBar(
          
         
          //current index will manage wchich element need to be selected 
        currentIndex: _choice,
        type: BottomNavigationBarType.shifting,
        items: [
          
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.deepOrange),
            title: new Text('Home',style: TextStyle(color: Colors.blue))
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Colors.deepOrange),
            title: new Text('Profile',style: TextStyle(color: Colors.blue),)
          ),

        ],

        onTap: (index){
            selectedTab(index);
        },

      );

  }

  // for flowting button

  Widget onFlowting(BuildContext context){
        
        return FloatingActionButton(

        backgroundColor: Colors.blue,
        onPressed:(){},
        tooltip: 'Add Notes',
        child: new Icon(Icons.add),

      ); 
  }

}