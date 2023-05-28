import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailOfComment extends StatelessWidget {
  const DetailOfComment({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd ");

    String converStringToDate(String _date) {
      DateTime now = DateTime.now();
      String formattedDateNow = DateFormat('dd-MM-yyyy ').format(now);
      return formattedDateNow;
      // DateTime dateTime = dateFormat.parse(_date);
      // String formattedOld = DateFormat('dd - MM - yyyy ').format(dateTime);
      // return formattedOld;
    }

    return Card(
      child: ListTile(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Khanh Herry', // tac gia cua bai viet
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                width: 22,
                child: Image.asset('assets/icons/heart.png'),
              )
            ],
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: ExpandableText(
              'Content: I would say that my parents managed to spend a good amount of time with me during my childhood, especially my mother who was a housewife and stayed at home all the time.',
              expandText: '',
              expandOnTextTap: true,
              collapseOnTextTap: true,
              animation: true,
              maxLines: 2,
              linkColor: Colors.black,
              style: TextStyle(fontSize: 16, color: Colors.black),
              //textAlign: TextAlign.justify,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  converStringToDate('21-05-2007'),
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 57, 55, 55).withOpacity(.8),
                  ),
                ),
                Text(
                  '1 lượt thích',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 57, 55, 55).withOpacity(.8),
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Container(
          width: size.width * .1,
          height: 50,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'http://m-grac.bsp.vn:8002/images/app-user-images/avatar-168233194564465929ab446-the_death.png',
            ),
            radius: 50,
          ),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }
}
