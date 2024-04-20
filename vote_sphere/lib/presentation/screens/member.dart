import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF85C1E9),
          title: Text(
            'Members',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Add functionality to navigate back if needed
            },
          ),
        ),
        body: MemberPage(),
      ),
    );
  }
}

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  TextEditingController _usernameController = TextEditingController();
  String _errorMessage = '';
  List<String> _members = [];
  bool _showForm = false;

  void toggleFormVisibility() {
    setState(() {
      _showForm = !_showForm;
      _errorMessage = ''; // Reset error message when toggling form visibility
    });
  }

  void addMember() {
    setState(() {
      if (_usernameController.text.isNotEmpty) {
        _members.add(_usernameController.text);
        _usernameController.clear();
        toggleFormVisibility();
      } else {
        _errorMessage = 'Please enter a username';
      }
    });
  }

  void deleteMember(int index) {
    setState(() {
      _members.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0), // Added x-direction padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          if (_errorMessage.isNotEmpty) // Display error message if it's not empty
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 7), // Added padding to the left of the circular avatar
              CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFF85C1E9),
                child: Icon(Icons.people, size: 50, color: Colors.white), // Changed the icon to 'people'
              ),
              SizedBox(width: 20),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _showForm
                        ? Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Enter Username',
                              labelStyle: TextStyle(color: Colors.black), // Text color
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF85C1E9)), // Border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF85C1E9)), // Focused border color
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),