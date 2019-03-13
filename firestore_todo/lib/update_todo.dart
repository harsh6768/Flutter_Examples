import 'package:firestore_todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateTodo extends StatefulWidget {
  String title, desc;
  final DocumentSnapshot doc;
  String id;
  UpdateTodo({this.title, this.desc, this.doc, this.id});

  _UpdateTodoState createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  //getting the referece of the FireStore instance
  var db = Firestore.instance;
  String _title, _desc;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Update Todo"),
        ),
        body: ListView(
          children: <Widget>[
            createForm(),
            Padding(
              padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 10.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  onUpdateTodo();
                },
                child: Text(
                  "Update Todo",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
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
                hintText: '${widget.title}',
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
                hintText: '${widget.desc}',
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

  //to update todo
  void onUpdateTodo() {
    db
        .collection("Todo")
        .document('${widget.doc.documentID}')
        .updateData({'todo_title': '$_title', 'todo_desc': '$_desc'});

    setState(() {
      //widget.id = documentReference.documentID;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Todo(),
          ));
    });
  }
}
