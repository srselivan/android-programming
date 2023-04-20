import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Item 1"),value: "Item 1"),
      DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
      DropdownMenuItem(child: Text("Item 3"),value: "Item 3"),
      DropdownMenuItem(child: Text("Item 4"),value: "Item 4"),
    ];
    return menuItems;
  }

  String _selectedValue = "Item 1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedValue,
      items: dropdownItems,
      onChanged: (String? value) {
        setState(() {
          _selectedValue = value!;
        });
        print(value!);
      },
    );
  }
}