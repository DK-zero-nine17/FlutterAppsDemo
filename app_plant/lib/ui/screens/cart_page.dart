import 'package:app_plant/models/plants.dart';
import 'package:flutter/material.dart';

import '../../containts.dart';
import 'widgets/plant_widget.dart';

class CartPage extends StatefulWidget {
  List<Plant> addsToCartPlants;
  CartPage({super.key, required this.addsToCartPlants});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.addsToCartPlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Cart is Impty',
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
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: widget.addsToCartPlants.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return PlantWidget(
                              plantList: widget.addsToCartPlants,
                              index: index,
                            );
                          })),
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 1.0,
                          height: 20,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Constants.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              r'$' + '122',
                              style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
  }
}
