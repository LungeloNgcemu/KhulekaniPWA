import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDown extends StatefulWidget {
  DropDown({this.listName,this.onChanged, this.selectedValue});

  List<String>? listName;
 dynamic onChanged;
  String? selectedValue;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: (widget.listName ?? [])
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
              .toList(),
          value: widget.selectedValue ??  "",
          onChanged: widget.onChanged ?? () {},
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 60,
          ),
        ),
      ),
    );
  }
}
