import 'package:demo_list_todo_again/modal/item_data.dart';
import 'package:flutter/material.dart';

import 'widget/card_body_widget.dart';
import 'widget/card_modal_button.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [
    // DataItems('1', 'Tap the duc'),
    // DataItems('2 ', 'An sang'),
    // DataItems('3', 'choi the thao'),
    // DataItems('4', 'An trua'),
    // DataItems('3', 'choi the thao'),
    // DataItems('4', 'An trua')
  ];

  void _handlAddTask(String name) {
    final newItem = DataItems(DateTime.now().toString(), name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handlDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'TODOLIST',
            ),
            centerTitle: true),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: items
                  .map((item) =>
                      Card_body(item: item, handlDeleteTask: _handlDeleteTask, index: items.indexOf(item)))
                  .toList(),

              // [
              // SizedBox(
              //   height: 10,
              // ),
              // Card_body(),
              // SizedBox(
              //   height: 10,
              // ),
              // Card_body(),
              //  ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true // giai quyet cho modal va key
                ,
                context: context,
                builder: ((context) {
                  return modal_button(addTask: _handlAddTask);
                }));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
