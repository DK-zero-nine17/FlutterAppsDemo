import 'package:app_plant/containts.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants _constants = Constants();

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.close,
                    color: Constants.primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() {}),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.share,
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
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/code-scan.png',
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tap to Scan',
                  style: TextStyle(
                      color: Constants.primaryColor.withOpacity(.8),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
          ),
        )
      ],
    ));
  }
}
