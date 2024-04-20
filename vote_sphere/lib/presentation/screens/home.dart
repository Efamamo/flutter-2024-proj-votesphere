import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/buttons.dart';
import 'new_polls.dart';
import 'questions_model.dart';
import 'settings.dart';
import 'login.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String group = '';
  TextEditingController groupName = TextEditingController();

  TextEditingController question = TextEditingController();
  TextEditingController choice1 = TextEditingController();
  TextEditingController choice2 = TextEditingController();
  TextEditingController choice3 = TextEditingController();
  TextEditingController choice4 = TextEditingController();
  TextEditingController choice5 = TextEditingController();
  List<Question> questions = [];

  String questionError = '';
  String choice1Error = '';
  String choice2Error = '';
  String choice3Error = '';
  List<Object?> _index = [];
  List<List> votes = [];
  List<bool> disabled = [];

  double sum(arr) {
    double res =
        arr.fold(0, (previousValue, element) => previousValue + element);
    if (res == 0) {
      return 1;
    }
    return res;
  }

  void submitForm() {
    setState(() {
      if (question.text == '') {
        questionError = 'Please Enter the question';
      }
      if (choice1.text == '') {
        choice1Error = 'Please Enter choice 1';
      }
      if (choice2.text == '') {
        choice1Error = 'Please Enter choice 2';
      }
      if (choice3.text == '') {
        choice1Error = 'Please Enter choice 3';
      } else {
        votes.add([]);
        List<String> answer = [];
        print(choice5.text);
        if (choice1.text != '') {
          answer.add(choice1.text);
          votes[votes.length - 1].add(0);
        }
        if (choice2.text != '') {
          answer.add(choice2.text);
          votes[votes.length - 1].add(0);
        }
        if (choice3.text != '') {
          answer.add(choice3.text);
          votes[votes.length - 1].add(0);
        }
        if (choice4.text != '') {
          answer.add(choice4.text);
          votes[votes.length - 1].add(0);
        }
        if (choice5.text != '') {
          answer.add(choice5.text);
          votes[votes.length - 1].add(0);
        }
        _index.add(double.infinity);
        disabled.add(false);

        Question current =
            Question(question: question.text, answers: answer, comment: []);
        questions.add(current);
        questionError = '';
        choice1Error = '';
        choice2Error = '';
        choice3Error = '';
        choice1.clear();
        choice2.clear();
        choice3.clear();
        choice4.clear();
        choice5.clear();
        question.clear();
        Navigator.pop(context);
      }
    });
  }

  void createGroup(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            title: const Text(
              "Create Group",
              style: TextStyle(color: Colors.black),
            ),
            content: TextField(
              controller: groupName,
              decoration: const InputDecoration(
                  hintText: 'Enter Group Name',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    group = groupName.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  "Create Group",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          );
        });
  }

  void navigateNewPolls() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewPolls(
        question: question,
        questionError: questionError,
        choice1Error: choice1Error,
        choice2Error: choice2Error,
        choice3Error: choice3Error,
        choice1: choice1,
        choice2: choice2,
        choice3: choice3,
        choice4: choice4,
        choice5: choice5,
        submit: submitForm,
      );
    }));
  }

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 34, 82),
        title: const Text(
          "VOTESPHERE",
          style: TextStyle(color: Colors.white, letterSpacing: 2.0),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(child: Image.asset('../../../assets/vote.jpg')),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(
                          width: 12,
                        ),
                        Text("HOME")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'settings');
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 12,
                        ),
                        Text("SETTINGS")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  group != ''
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'members');
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.people),
                              SizedBox(
                                width: 12,
                              ),
                              Text("MEMBERS")
                            ],
                          ),
                        )
                      : const Text(''),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 12,
                    ),
                    Text("LOGOUT")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: group == ''
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    '../../../assets/vote.jpg',
                    width: 230,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Padding(
                      padding: const EdgeInsets.only(left: 25, right: 80),
                      child: Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: 'Votesphere',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 2, 34, 82),
                            ),
                          ),
                          TextSpan(
                            text:
                                " is a dynamic voting platform that makes group decision-making a breeze. Whether you're planning a trip with friends, organizing an event, or seeking opinions on important topics, Votesphere has you covered. ",
                          ),
                        ],
                        style: TextStyle(fontSize: 16),
                      ))),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Create A Group to get Started",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 2, 34, 82),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Create group'),
                      onPressed: () {
                        createGroup(context);
                      },
                    ),
                  )
                ],
              )
            : questions.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        '../../../assets/vote.jpg',
                        width: 230,
                      ),
                      Text(group),
                      const Text(
                        "You dont have polls",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue[700]),
                          onPressed: navigateNewPolls,
                          child: Text("Add Poll"))
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(children: [
                      Image.asset(
                        '../../../assets/vote.jpg',
                        width: 230,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("Your Polls",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      Column(
                        children: [
                          ...questions.map((question) => Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(question.question,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _index.remove(_index[
                                                        questions.indexOf(
                                                            question)]);
                                                    votes.remove(votes[questions
                                                        .indexOf(question)]);
                                                    disabled.remove(disabled[
                                                        questions.indexOf(
                                                            question)]);
                                                    questions.remove(question);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red[900],
                                                ))
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        height: 20,
                                      ),
                                      ...question.answers.map((choice) =>
                                          RadioListTile(
                                              fillColor: MaterialStateColor
                                                  .resolveWith((states) {
                                                if (states.contains(
                                                    MaterialState.selected)) {
                                                  return Colors.blue
                                                      .shade700; // Active color
                                                } else {
                                                  return Colors.blue
                                                      .shade700; // Inactive color (same as active color)
                                                }
                                              }),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text((((votes[questions
                                                                      .indexOf(
                                                                          question)][question
                                                                      .answers
                                                                      .indexOf(
                                                                          choice)]) /
                                                                  sum(votes[questions
                                                                      .indexOf(
                                                                          question)])) *
                                                              100)
                                                          .toStringAsFixed(2) +
                                                      '%'),
                                                  LinearProgressIndicator(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: Colors.blue.shade700,
                                                    value: (votes[questions
                                                                .indexOf(
                                                                    question)][
                                                            question.answers
                                                                .indexOf(
                                                                    choice)]) /
                                                        sum(votes[
                                                            questions.indexOf(
                                                                question)]),
                                                    minHeight: 4,
                                                  ),
                                                ],
                                              ),
                                              title: Text(choice),
                                              value: 5 *
                                                      questions
                                                          .indexOf(question) +
                                                  question.answers
                                                      .indexOf(choice),
                                              groupValue: _index[
                                                  questions.indexOf(question)],
                                              onChanged: disabled[questions
                                                      .indexOf(question)]
                                                  ? null
                                                  : (value) {
                                                      setState(() {
                                                        votes[questions.indexOf(
                                                                question)][
                                                            question.answers
                                                                .indexOf(
                                                                    choice)] += 1;
                                                        _index[questions
                                                                .indexOf(
                                                                    question)] =
                                                            value;
                                                        // disabled[questions
                                                        //         .indexOf(
                                                        //             question)] =
                                                        //     true;
                                                      });
                                                    })),
                                      const Divider(
                                        height: 10,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 4),
                                        child: Text("Comments",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      ...question.comment.map((com) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 6),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.person),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(com)
                                              ],
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: TextField(
                                          controller: commentController,
                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: Icon(Icons.send),
                                                onPressed: () {
                                                  setState(() {
                                                    question.comment.add(
                                                        commentController.text);
                                                    commentController.clear();
                                                  });
                                                },
                                              ),
                                              hintText: 'Write comment...'),
                                        ),
                                      )
                                    ]),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue[700]),
                          onPressed: navigateNewPolls,
                          child: const Text("Add Poll"))
                    ]),
                  ),
      ),
    );
  }
}
