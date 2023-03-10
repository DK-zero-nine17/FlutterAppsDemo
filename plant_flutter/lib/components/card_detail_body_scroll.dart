import 'package:flutter/material.dart';

import 'card_detail_image.dart';

class card_body_scroll extends StatelessWidget {
  var typeTitle;

  card_body_scroll({
    Key? key,
    required this.typeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      color: Color.fromARGB(255, 221, 216, 216),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('$typeTitle',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: (() {}),
                  child: Text(
                    'More',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 68, 65, 65)),
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            MyContainer_image(
              image: "images/image_1",
              title: 'SAMANTHA',
              country: 'RUSSIA',
              price: 400,
              press: () {},
            ),
            MyContainer_image(
              image: "images/image_2",
              title: 'ANGELICA',
              country: 'RUSSIA',
              price: 500,
              press: () {},
            ),
            MyContainer_image(
              image: "images/image_3",
              title: 'SACARA',
              country: 'JAPAN',
              price: 450,
              press: () {},
            ),
            MyContainer_image(
              image: "images/img_main",
              title: 'MANTAHA',
              country: 'RUSSIA',
              price: 600,
              press: () {},
            ),
          ]),
        )
      ]),
    );
  }
}
