import 'package:flutter/material.dart';

import 'Cstoms/CustomTextField.dart';
import 'HOME PAGE.dart';
import 'services/services.dart';

class EditTaskScreen extends StatefulWidget {
  String? title;
  String? description;
  final int index;

  EditTaskScreen({this.title, this.description, required this.index});
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  @override
  void initState() {
    if (widget.title == null || widget.description == null) {
      title.text = "enter correct value";

      description.text = "enter  correct value";
    } else {
      title.text = widget.title.toString();
      description.text = widget.description.toString();
    }
    //

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
        backgroundColor: Color(0xFF8A8AE2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            child:
            return (Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(controller: title, labels: "title"),
                    SizedBox(height: 16),
                    CustomTextField(controller: description, labels: "details"),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add your update task logic here
                            if (_formkey.currentState!.validate()) {
                              replace(
                                head: title.text,
                                details: description.text,
                                index1: widget.index,
                              );
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoHomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8A8AE2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text('Update'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              title.text = "";
                              description.text = "";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8A8AE2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
          }),
    );
  }
}
