import 'package:flutter/material.dart';
import 'drop_down.dart';

class MenuList extends StatefulWidget {
  MenuList(
      {this.text,
        this.onChanged,
        this.listName,
        this.selectedValue,
        this.choice,
        key});

  String? text;
  dynamic onChanged;
  List<String>? listName;
  String? selectedValue;
  String? choice;

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80.0,
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.text ?? "",
                  // Use null-aware operator to provide an empty string if text is null
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropDown(
                  selectedValue: widget.selectedValue ?? "",
                  listName: widget.listName ?? [],
                  onChanged: widget.onChanged ?? () {},
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                ),
                child: FittedBox(
                    child: Text(
                      widget.choice ?? "",
                      style: TextStyle(fontSize: 20.0),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

