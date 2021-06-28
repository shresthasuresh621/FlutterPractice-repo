import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "ToDo App",
    home: TODOAPP(),
  ));
}

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO Application",
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(),
          ),
          ListTile(
            title: Text("Get Up"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("Eat"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("code"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("Sleep"),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text("Repeate"),
            leading: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
