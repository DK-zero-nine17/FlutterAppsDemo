import 'package:flutter/material.dart';

class DividerGachKe extends StatelessWidget {
  const DividerGachKe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5,
      thickness: 8,
      color: Colors.grey.withOpacity(.4),
    );
  }
}
