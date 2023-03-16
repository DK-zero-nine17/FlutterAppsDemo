
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../containts.dart';
import '../../../models/plants.dart';
import '../detail_page.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    Key? key,
    required List<Plant> plantList,
    required this.index,
  })  : _plantList = plantList,
        super(key: key);

  final List<Plant> _plantList;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(plantId: _plantList[index].plantId),
                type: PageTransitionType.bottomToTop));
      }),
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        width: size.width,
        padding: EdgeInsets.only(top: 10, left: 10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      height: 80,
                      child: Image.asset(_plantList[index].imageURL),
                    )),
                Positioned(
                    left: 80,
                    bottom: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_plantList[index].category),
                        Text(
                          _plantList[index].plantName,
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                r'$' + _plantList[index].price.toString(),
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
