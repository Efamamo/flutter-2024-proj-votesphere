import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Username"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("email"),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("groupNumber"),
          ),
          Row(
            children: [
              TextButton(child: Text("DeleteAccount"), onPressed: () {}),
              TextButton(child: Text("Update Username"), onPressed: () {})
            ],
          )
        ],
      ),
    ));
  }
}
