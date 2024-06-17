// import 'package:flutter/material.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple[200],
//         title: Row(
//           children: [
//             Text(
//               'TODO APP',
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             SizedBox(
//               width: 300,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.calendar_today),
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: Colors.deepPurple[50],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:todoapp/subhome.dart';

import 'addtask.dart';
import 'completetask.dart';

class TodoHomePage extends StatefulWidget {
  TodoHomePage({
    super.key,
  });

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [subhome(), CompletedTasksPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the second page when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          ).then((value) => setState(
                () {
                  print(value);
                },
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
