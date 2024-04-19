import 'package:flutter/material.dart';
import '../widgets/textfield.dart';

class NewPolls extends StatefulWidget {
  NewPolls({
    required this.question,
    required this.choice1,
    required this.choice2,
    required this.choice3,
    required this.choice4,
    required this.choice5,
    required this.error,
    required this.submit,
  });
  TextEditingController question;
  TextEditingController choice1;
  TextEditingController choice2;
  TextEditingController choice3;
  TextEditingController choice4;
  TextEditingController choice5;
  void Function() submit;
  String error = '';

  @override
  State<NewPolls> createState() => _NewPollsState();
}

class _NewPollsState extends State<NewPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Enter Poll Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Question:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyTextField(
                        hintText: 'Enter the question......',
                        controller: widget.question),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choice 1:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyTextField(
                        hintText: 'Enter the choice1......',
                        controller: widget.choice1),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choice 2:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyTextField(
                        hintText: 'Enter the choice2......',
                        controller: widget.choice2),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choice 3:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyTextField(
                        hintText: 'Enter the choice3......',
                        controller: widget.choice3),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choice 4:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: MyTextField(
                        hintText: 'Enter the choice4......',
                        controller: widget.choice4),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choice 5:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyTextField(
                        hintText: 'Enter the choice5......',
                        controller: widget.choice5),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
                onPressed: widget.submit,
                child: const Text('Add Pole'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.error,
                style: const TextStyle(color: Colors.red),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
