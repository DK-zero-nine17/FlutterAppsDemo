import 'package:flutter/material.dart';

class body_header_detail extends StatelessWidget {
  const body_header_detail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(children: <Widget>[
        Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 184, 31),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Row(children: <Widget>[
            Text(
              'Hi UIShopy!',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Image.asset(
              'assets/icons/flower.png',
              height: 50,
            ),
          ]),
        ),
        Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 234, 234),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 20,
                        color: Colors.black),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Search',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Image.asset(
                      'assets/icons/search_1.png',
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
