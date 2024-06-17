import 'package:flutter/material.dart';
import 'package:todoapp/HOME%20PAGE.dart';
import 'package:todoapp/services/services.dart';

class CompletedTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoHomePage(),
                ));
            // Handle back button press
          },
        ),
        title: Text('Completed Task'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.purple[50],
        child: ListView.builder(
          itemCount: comp.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(
              title1: comp[index]['title'],
              subtitle1: comp[index]['subtitle'],
            );
          },
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  String title1;
  String subtitle1;
  TaskCard({required this.title1, required this.subtitle1});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              subtitle1,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
