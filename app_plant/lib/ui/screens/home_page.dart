import 'package:app_plant/containts.dart';
import 'package:app_plant/models/plants.dart';
import 'package:app_plant/ui/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'widgets/plant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    // plant category
    List<String> _plantTypes = [
      'Recommened',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    //toggle favorited button
    bool toggleIsFavorated(bool isFavorated) {
      return !isFavorated;
    }

    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.only(top: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: size.width * .9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.black54.withOpacity(.6),
                              ),
                              Expanded(
                                  child: TextField(
                                showCursor: false,
                                decoration: InputDecoration(
                                    hintText: 'Search Plant',
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              )),
                              Icon(
                                Icons.mic,
                                color: Colors.black54.withOpacity(.6),
                              )
                            ]),
                      )
                    ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Constants.primaryColor.withOpacity(.1)),
              ),
              Container(
                height: 50,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _plantTypes.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: (() {
                            setState(() {
                              selectedIndex = index;
                            });
                          }),
                          child: Text(
                            _plantTypes[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w400,
                              color: selectedIndex == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor,
                            ),
                          ),
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: size.height * .3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                  plantId: _plantList[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(children: [
                          Positioned(
                              top: 10,
                              right: 20,
                              child: Container(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  icon: Icon(
                                    _plantList[index].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Constants.primaryColor,
                                  ),
                                  iconSize: 30,
                                  onPressed: (() {
                                    setState(() {
                                      bool isFavorated = toggleIsFavorated(
                                          _plantList[index].isFavorated);
                                      _plantList[index].isFavorated =
                                          isFavorated;
                                    });
                                  }),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                              )),
                          Positioned(
                              top: 50,
                              right: 50,
                              bottom: 50,
                              left: 50,
                              child: Image.asset(_plantList[index].imageURL)),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[index].category,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white70),
                                  ),
                                  Text(
                                    _plantList[index].plantName,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r'$' + _plantList[index].price.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ),
                          )
                        ]),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 16,
                ),
                child: Text(
                  'New Plants',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: _plantList.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return PlantWidget(plantList: _plantList, index: index);
                    })),
              ),
            ],
          )),
    );
  }
}
