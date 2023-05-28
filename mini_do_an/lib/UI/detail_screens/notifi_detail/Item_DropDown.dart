import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemDropDown extends StatefulWidget {
  ItemDropDown({
    super.key,
    required this.listOptions,
    required this.getValue,
  });
  List<String> listOptions;
  Function getValue;
  @override
  State<ItemDropDown> createState() => _ItemDropDownState();
}

class _ItemDropDownState extends State<ItemDropDown> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.white.withOpacity(.4),
      child: DropdownButton<String>(
        value: _selectedOption,
        items: widget.listOptions.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Container(
              height: 40,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.2),
                // color: Colors.grey[300],
              ),
              child: Center(
                  child: Text(
                '$option',
                style: TextStyle(fontSize: 16),
              )),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.getValue(newValue);
            _selectedOption = newValue;
            // if (_selectedOption != 'Vibration') {
            //   print('$_selectedOption');
            // }
          });
        },
      ),
    );
  }
}
