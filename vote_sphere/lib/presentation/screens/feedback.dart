import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedBackForm extends StatelessWidget {
  const FeedBackForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Feedback",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: Colors.amberAccent, // color of the underline
              height: 1.0, // thickness of the underline
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Choose the category of your feedback",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    FeedbackWidget(text: "login"),
                    FeedbackWidget(text: "signup"),
                    FeedbackWidget(text: "poll"),
                    FeedbackWidget(text: "other issues"),
                    FeedbackWidget(text: "suggestion"),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: TextField(
                    autofocus: false,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText:
                      "Please briefly describe the issue you have faced",
                      hintStyle: TextStyle(
                          fontSize: 13, color: Color(0xffc5c5c5)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffe5e5e5))),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  minWidth: 80,
                  height: 40,
                  color: Colors.lightBlueAccent,
                  onPressed: () {},
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackWidget extends StatefulWidget {
  final String text;
  const FeedbackWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Row(
      children: [
        Checkbox(
          checkColor: Colors.grey,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: isChecked ? Colors.blue : Colors.black,
          ),
        ),
      ],
    );
  }
}

