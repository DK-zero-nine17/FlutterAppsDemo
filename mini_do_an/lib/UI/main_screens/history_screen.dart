import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _isXacThuc = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Xét Duyệt')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          _isXacThuc = !_isXacThuc;
                        });
                      }),
                      child: Text('Chưa duyệt'),
                      style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors
                        //     .pinkAccent, //change text color of button
                        backgroundColor: _isXacThuc
                            ? Colors.blue
                            : Colors.grey, //change background color of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          _isXacThuc = !_isXacThuc;
                        });
                      }),
                      child: Text('Đang chờ xử lý'),
                      style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors
                        //     .pinkAccent,
                        backgroundColor: _isXacThuc ? Colors.grey : Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            _isXacThuc
                ? Container(
                    height: size.height * 8,
                    width: size.width,
                    color: Colors.blue,
                  )
                : Container(
                    height: size.height * 8,
                    width: size.width,
                    color: Colors.grey,
                  )
          ],
        ),
      ),
    );
  }
}
