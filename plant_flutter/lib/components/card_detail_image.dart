
import 'package:flutter/material.dart';

class MyContainer_image extends StatelessWidget {
  var image, title, country, price;
  Function press;

  MyContainer_image({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(children: [
        Container(
          child: Image.asset(
            'assets/$image.png',
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
          ),
          color: Colors.grey,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 223, 223),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title \n $country',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text(
                "$price VND",
                style: TextStyle(color: Colors.green, fontSize: 15),
              )
            ],
          ),
        )
      ]),
    );
  }
}
