import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 34, 82),
          title: const Text(
            "SETTINGS",
            style: TextStyle(color: Colors.white, letterSpacing: 2.0),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: Container(
          height: 300,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 253, 250, 250),
              border: Border.all(),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Ephrem"),
                subtitle: Text("username"),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("e@gmail.com"),
                subtitle: Text("email"),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("group 1"),
                subtitle: Text("group"),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      child: Text("Update Username"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      onPressed: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      child: Text("DeleteAccount"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ));
  }
}
