import 'package:app_plant/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'package:app_plant/containts.dart';

import 'login_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0.0, backgroundColor: Colors.white, actions: [
        Padding(
          padding: EdgeInsets.only(right: 20, top: 20),
          child: InkWell(
            child: Text(
              'Skip',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: ((context) => RootPage())));
            },
          ),
        )
      ]),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        PageView(
          onPageChanged: ((page) {
            setState(() {
              currentIndex = page;
            });
          }),
          controller: _pageController,
          children: [
            createPage(
              image: 'assets/images/plant-one.png',
              title: Constants.titleOne,
              description: Constants.descriptionOne,
            ),
            createPage(
              image: 'assets/images/plant-two.png',
              title: Constants.titleTwo,
              description: Constants.descriptionTwo,
            ),
            createPage(
              image: 'assets/images/plant-three.png',
              title: Constants.titleThree,
              description: Constants.descriptionThree,
            )
          ],
        ),
        Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(currentIndex),
            )),
        Positioned(
          bottom: 60,
          right: 30,
          child: Container(
            decoration: BoxDecoration(
                color: Constants.primaryColor, shape: BoxShape.circle),
            child: IconButton(
                onPressed: (() {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: Duration(microseconds: 2000),
                            curve: Curves.easeIn);
                      }
                    } else {
                      // neu khac het thi chuyen sang page Login
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => RootPage())));
                    }
                  });
                }),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                )),
          ),
        )
      ]),
    );
  }
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(microseconds: 300),
    height: 10,
    width: isActive ? 30 : 12,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
        color: Constants.primaryColor, borderRadius: BorderRadius.circular(5)),
  );
}

// create a list indicator
List<Widget> _buildIndicator(int currentIndex) {
  List<Widget> indicators = [];
  for (var i = 0; i < 3; i++) {
    if (currentIndex == i) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}

class createPage extends StatelessWidget {
  String image, title, description;
  createPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 50, left: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          )
        ],
      ),
    );
  }
}
