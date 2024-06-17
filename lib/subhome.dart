import 'package:flutter/material.dart';
import 'package:todoapp/calender/Calendar.dart';
import 'package:todoapp/services/services.dart';

import 'completetask.dart';
import 'editpage.dart';

class subhome extends StatefulWidget {
  const subhome({
    super.key,
  });

  @override
  State<subhome> createState() => _subhomeState();
}

class _subhomeState extends State<subhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Calendar(),
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  data[index]['title'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                subtitle: Text(data[index]['subtitle']),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.purple),
                      onPressed: () {
                        print(data[index]['title']);

                        // Navigate to the second page when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTaskScreen(
                                    title: data[index]['title'],
                                    description: data[index]['subtitle'],
                                    index: index,
                                  )),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          delete(indexxx: index);
                        });
                      },
                      icon: Icon(Icons.delete, color: Colors.purple),
                    ),
                    IconButton(
                      icon: Icon(Icons.check_circle, color: Colors.purple),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompletedTasksPage(),
                            ));
                        completed(
                            head: data[index]['subtitle'],
                            details: data[index]['title'],
                            indexss: index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
