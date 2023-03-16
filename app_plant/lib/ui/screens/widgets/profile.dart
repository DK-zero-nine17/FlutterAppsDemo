import 'package:flutter/material.dart';

import '../../../containts.dart';

class ProfileWidget extends StatelessWidget {
  var icon;
  var title;
  ProfileWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 150,
            child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/profile.png'),
                radius: 50),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(.5),
                  width: 5,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20, color: Constants.blackColor),
                ),
                SizedBox(
                  height: 24,
                  child: Image.asset('assets/images/verified.png'),
                )
              ],
            ),
          ),
          Text(
            "johnDoe@gmai.com",
            style: TextStyle(color: Constants.primaryColor.withOpacity(.5)),
          ),
          SizedBox(
            height: 0,
          ),
          SizedBox(
              height: size.height * .7,
              width: size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                icon,
                                color: Constants.blackColor.withOpacity(.5),
                                size: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                title,
                                style: TextStyle(
                                  color: Constants.blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Constants.blackColor.withOpacity(.4),
                            size: 16,
                          )
                        ],
                      ),
                    )
                  ]))
        ]));
  }
}
