import 'package:flutter/material.dart';

class modal_button extends StatelessWidget {
  modal_button({
    Key? key,
    required this.addTask,
  }) : super(key: key);
  Function addTask;
  TextEditingController _textCtrl = new TextEditingController();
  void handleOnclick(BuildContext context) {
    final name = _textCtrl.text;

    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context)
          .viewInsets //giup day keyboard ma ko mat di modal
      ,
      child:
          SingleChildScrollView //thay cho container => giup cho modal ko bi nen
              (
                  // height: 150,
                  // color: Colors.white,
                  child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: _textCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data',
                  hintText: 'nhap data'),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (() {
                    handleOnclick(context);
                  }),
                  child: Text('Add Task')),
            )
          ],
        ),
      )),
    );
  }
}
