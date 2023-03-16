import 'package:app_plant/containts.dart';
import 'package:app_plant/models/plants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({
    super.key,
    required this.plantId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.15),
                      borderRadius: BorderRadius.circular(25)),
                  child: Icon(
                    Icons.close,
                    color: Constants.primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    bool isFavorited = toggleIsFavorated(
                        _plantList[widget.plantId].isFavorated);
                    _plantList[widget.plantId].isFavorated = isFavorited;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.15),
                      borderRadius: BorderRadius.circular(25)),
                  child: Icon(
                    _plantList[widget.plantId].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Constants.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 100,
          right: 20,
          left: 20,
          child: Container(
              height: size.height * .8,
              width: size.width * .8,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 10,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 10,
                    child: SizedBox(
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlantFeaTure(
                            title: 'Size',
                            plantFeature: _plantList[widget.plantId].size,
                          ),
                          PlantFeaTure(
                            title: 'Humidity',
                            plantFeature:
                                _plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeaTure(
                            title: 'Temperature',
                            plantFeature:
                                _plantList[widget.plantId].temperature,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.only(top: 80, left: 30, right: 30),
            height: size.height * .5,
            width: size.width,
            decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _plantList[widget.plantId].plantName,
                          style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          r'$' + _plantList[widget.plantId].price.toString(),
                          style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _plantList[widget.plantId].rating.toString(),
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 30,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 30,
                          color: Constants.primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Text(
                  _plantList[widget.plantId].decription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 18,
                      color: Constants.blackColor.withOpacity(.7)),
                ))
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: SizedBox(
        height: 50,
        width: size.width * 9,
        child: Row(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        bool isSelected = toggleIsSelected(
                            _plantList[widget.plantId].isSelected);
                        _plantList[widget.plantId].isSelected = isSelected;
                      });
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: _plantList[widget.plantId].isSelected == true
                          ? Colors.white
                          : Constants.primaryColor,
                    )),
                decoration: BoxDecoration(
                    color: _plantList[widget.plantId].isSelected == true
                        ? Constants.primaryColor.withOpacity(.5)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: Constants.primaryColor.withOpacity(.3))
                    ])),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.8),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    )
                  ]),
              child: Center(
                  child: Text(
                'BUY NOW',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            )),
          ],
        ),
      ),
    );
  }
}

class PlantFeaTure extends StatelessWidget {
  var title, plantFeature;
  PlantFeaTure({
    Key? key,
    this.title,
    this.plantFeature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor, fontSize: 15),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
