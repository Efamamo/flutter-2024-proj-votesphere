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
    required this.choice1Error,
    required this.choice2Error,
    required this.choice3Error,
    required this.questionError,
    required this.submit,
  });
  TextEditingController question;
  TextEditingController choice1;
  TextEditingController choice2;
  TextEditingController choice3;
  TextEditingController choice4;
  TextEditingController choice5;
  void Function() submit;
  String choice1Error = '';
  String choice2Error = '';
  String choice3Error = '';
  String questionError = '';

  @override
  State<NewPolls> createState() => _NewPollsState();
}

class _NewPollsState extends State<NewPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 34, 82),
        title: const Text(
          "POLLS",
          style: TextStyle(color: Colors.white, letterSpacing: 2.0),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Please enter the poll information. Make sure to include a question for the poll, as well as three answer choices. All fields are required, so ensure you provide a question and three choices to complete the poll entry.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter Poll Information",
                style: TextStyle(
                    color: const Color.fromARGB(255, 2, 34, 82),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Question",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ]),
                  ),
                  MyTextField(
                      hintText: 'Enter the question......',
                      controller: widget.question,
                      lines: 3),
                  Text(
                    widget.questionError,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Choice 1",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ]),
                  ),
                  MyTextField(
                      hintText: 'Enter the choice1......',
                      controller: widget.choice1,
                      lines: 1),
                  Text(
                    widget.choice1Error,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Choice 2",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ]),
                  ),
                  MyTextField(
                      hintText: 'Enter the choice2......',
                      controller: widget.choice2,
                      lines: 1),
                  Text(
                    widget.choice2Error,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "Choice 3",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ]),
                  ),
                  MyTextField(
                      hintText: 'Enter the choice3......',
                      controller: widget.choice3,
                      lines: 1),
                  Text(
                    widget.choice3Error,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choice 4",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MyTextField(
                      hintText: 'Enter the choice4......',
                      controller: widget.choice4,
                      lines: 1),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Choice 5",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MyTextField(
                      hintText: 'Enter the choice5......',
                      controller: widget.choice5,
                      lines: 1),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: widget.submit,
                child: const Text('Add Pole'),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
