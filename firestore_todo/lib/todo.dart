import 'package:firestore_todo/update_todo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Todo extends StatefulWidget {
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  //to check the state of the process
  String id;
  static String _title, _desc;

  GlobalKey<FormState> _formStateKey = new GlobalKey<FormState>();

  //getting the reference of the fireStore instance
  var db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo'),
        ),
        body: ListView(
          children: <Widget>[
            //to create the form
            createForm(),
            Container(
              height: 50.0,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 36.0, right: 36.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    addTodoOnFireStore();
                  },
                  child: Text(
                    "Add todo",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            //to use when we need the dynamic change of widget of the any container
            //let say if want to delete any item then it will delete and then manage the state of the widget
            StreamBuilder<QuerySnapshot>(
              //to get the snapshot of the documents
              stream: db.collection("Todo").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data.documents
                          .map((doc) => createSingleItem(doc))
                          .toList());
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding createForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formStateKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: 'Enter title',
                filled: true,
              ),
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter title';
                }
              },
              onSaved: (input) => _title = input,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: 'Enter decription',
                filled: true,
              ),
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter description';
                }
              },
              onSaved: (input) => _desc = input,
            ),
          ],
        ),
      ),
    );
  }

  //to save the data into the fireStore Database
  void addTodoOnFireStore() async {
    var currentState = _formStateKey.currentState;

    /*
    Map<String, String> todoMap = new Map<String, dynamic>();
    //putIfAbsent will add the data if and only if there is no existence of the this key
    todoMap.putIfAbsent('todo_title', () => _title);
    todoMap.putIfAbsent('todo_desc', () => _desc);
      
      */

    if (currentState.validate()) {
      //to save the state of the form
      _formStateKey.currentState.save();

      //to add the data and get the reference of the added data
      DocumentReference documentReference = await db
          .collection('Todo')
          .add({'todo_title': '$_title', 'todo_desc': '$_desc'});

      //setting the state of the form
      setState(() {
        id = documentReference.documentID;
      });
    }
  }

  //to delete the todo from the todo list
  void deleteTodo(DocumentSnapshot doc) async {
    await db.collection("Todo").document(doc.documentID).delete();

    setState(() {
      id = null;
    });
  }

  // to update the todo
  void updateTodo(DocumentSnapshot doc) async {
    //await db.collection("Todo").document(doc.documentID).updateData()
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              UpdateTodo(title: _title, desc: _desc, doc: doc, id: id),
        ));
  }

//creating and displaying the single card item
  Card createSingleItem(DocumentSnapshot doc) {
    return Card(
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'title: ${doc.data['todo_title']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'todo: ${doc.data['todo_desc']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //to update the todo
                FlatButton(
                  onPressed: () {
                    updateTodo(doc);
                  },
                  child: Text('Update todo',
                      style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),

                //to delete the todo
                FlatButton(
                  onPressed: () {
                    deleteTodo(doc);
                  },
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
