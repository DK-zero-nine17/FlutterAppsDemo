import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 238, 244),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 53, 92),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Icon(
              Icons.thunderstorm_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: size.height * .3 + 50,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color.fromARGB(255, 6, 53, 92),
            ),
          ),
        ),
        // Avatar
        Positioned(
          top: size.height * .1 - 60,
          right: 0,
          left: 0,
          child: Container(
            height: size.height * .2,
            width: size.width * .2,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(20),
                //     bottomRight: Radius.circular(20)),
                color: Color.fromARGB(255, 183, 201, 215),
                shape: BoxShape.circle),
          ),
        ),
        //Card Information
        Positioned(
          top: size.height * .2 + 50,
          left: 20,
          right: 20,
          child: Card(
              child: Container(
            height: size.height * .2,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Text(
                    'Viktor Frand',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lớp:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "CNTT.K60",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MSSV:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "6051071057",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SDT:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "0339640582",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ]),
          )),
        ),
        Positioned(
          top: size.height * .5,
          right: 20,
          left: 20,
          child: Card(
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * .5 + 70,
          right: 20,
          left: 20,
          child: Card(
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Favorite Notifications',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * .5 + 140,
          right: 20,
          left: 20,
          child: Card(
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
