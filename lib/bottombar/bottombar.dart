import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_todolist/calculator/calculator.dart';
import 'package:flutter_app_todolist/personal_data/personal_data.dart';
import 'package:flutter_app_todolist/todolist/todolist.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
  // static Route route() {
  //   if (Platform.isAndroid) {
  //     // Android-specific code
  //     return PageTransition<void>(
  //       type: PageTransitionType.rightToLeft,
  //       child: MyBottomBar(),
  //     );
  //   } else {
  //     // iOS-specific code
  //     return MaterialPageRoute<void>(
  //       builder: (_) => MyBottomBar(),
  //     );
  //   }
  // }
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ToDoList(),
    MyCalculatorPage(
      title: '',
    ),
    Personal(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //           '',
      //           style: Theme.of(context).textTheme.titleLarge,
      //         ),
      //         backgroundColor: Colors.transparent,
      //     ),
      body: Center(
        //  child: _widgetOptions[_selectedIndex],
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: 'to do list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'เครื่องคิดเลข',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_rounded),
            label: 'เก็บข้อมูล',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(255, 131, 142, 152),
      ),
    );
  }
}
