import 'package:app_plant/containts.dart';
import 'package:app_plant/models/plants.dart';
import 'package:app_plant/ui/screens/widgets/plant_widget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  List<Plant> favoratedPlant;
  FavoritePage({super.key, required this.favoratedPlant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: widget.favoratedPlant.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your favorited Plants',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Constants.primaryColor),
                    )
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: widget.favoratedPlant.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return PlantWidget(
                        plantList: widget.favoratedPlant,
                        index: index,
                      );
                    })),
              ));
  
  }
}
