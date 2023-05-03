import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CheckAvatarUrl extends StatelessWidget {
  const CheckAvatarUrl({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<http.Response>(
        future: http.head(Uri.parse(imageUrl)),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.statusCode == 200) {
              // Image URL is valid
              return CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
              );
            } else {
              // Image URL is invalid
              return CircleAvatar(
                backgroundImage: NetworkImage(
                  'http://m-grac.bsp.vn:8002/images/app-user-images/avatar-168233194564465929ab446-the_death.png',
                ),
              );
              //Text('Invalid image URL');

            }
          }
          return SizedBox(
            height: 10,
          );
          // else {
          //   // Connection is not yet complete
          //   return CircularProgressIndicator();
          // }
        },
      ),
    );
  }
}
