import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CheckUrlOfImage extends StatelessWidget {
  const CheckUrlOfImage({
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
              return Image.network(
                imageUrl,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              );
            } else {
              // Image URL is invalid
              return Image.network(
                'https://th.bing.com/th/id/R.af97372c88d3b4718189dcbd2a178a36?rik=xuFmwAlGmSaibQ&pid=ImgRaw&r=0',
                fit: BoxFit.cover,
                gaplessPlayback: true,
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
