import 'package:flutter/material.dart';

class Card_body extends StatelessWidget {
  Card_body({
    Key? key,
    required this.item,
    required this.handlDeleteTask,
    required this.index,
  }) : super(key: key);
  var item;
  var index;
  Function handlDeleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (index % 2 == 0)
            ? Color.fromARGB(255, 62, 172, 194)
            : Color.fromARGB(255, 236, 137, 211),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InkWell(
                child: Icon(
                  Icons.delete_outline,
                  size: 30,
                ),
                onTap: ((() => showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: Text("AlertDialog"),
                          content: Text("Would you like to delete this Task?"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                print('cancel');
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text("Agree"),
                              onPressed: () {
                                handlDeleteTask(item.id);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )))))),
          ],
        ),
      ),
    );
  }
}
