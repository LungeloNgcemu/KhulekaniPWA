import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'drop_down.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:multiselect/multiselect.dart';

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
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.text ?? "",
                  // Use null-aware operator to provide an empty string if text is null
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                ),
              ),
            ),
            Expanded(
              flex: 2,
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
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 20,
                  right: 50
                ),
                child: SizedBox.expand(
                  child: Text(
                    widget.choice ?? "",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DropMenu extends StatefulWidget {
DropMenu({
  this.items,
  value,
  this.onChanged,
  this.selectedItemBuilder,
  this.display,
  this.message,
  super.key});



  List<DropdownMenuItem<String>>?  items;
void Function(String?)? onChanged;
  String? value;
List<Widget> Function(BuildContext)? selectedItemBuilder;
String? display;
String? message;

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {



  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
          child: Column(
            children: [
              Text(widget.message ?? '',style: TextStyle(fontSize: 25),),

              Row(
                children: [
                  //Text(widget.message ?? '',style: TextStyle(fontSize: 25),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            '',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          //1.
                          items: widget.items ?? [],
                          //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                          //2.
                          value:   widget.value,

                          onChanged: widget.onChanged ?? (value) {},
                          //3.
                          selectedItemBuilder: widget.selectedItemBuilder,
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(left: 16, right: 50),
                            height: 60,
                            width: 170,
                          ),
                          menuItemStyleData: const MenuItemStyleData(

                            height: 40,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(widget.display ?? '',style: TextStyle(fontSize:15.0 ),softWrap: true,),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );

  }
}



//selected builder

// (context) {
// return items.map(
// (item) {
// return Container(
// alignment: AlignmentDirectional.center,
// child: Text(
// selectedItems.join(', '),
// style: const TextStyle(
// //Font Size
// fontSize: 20,
// overflow: TextOverflow.ellipsis,
// ),
// maxLines: 1,
// ),
// );
// },
// ).toList();
// }


//value
// selectedItems.isEmpty ? null : selectedItems.last


//items

// items.map((item) {
// return DropdownMenuItem(
// value: item,
// //disable default onTap to avoid closing menu when selecting an item
// enabled: false,
// child: StatefulBuilder(
// builder: (context, menuSetState) {
// final isSelected = selectedItems.contains(item);
// return InkWell(
// onTap: () {
// isSelected ? selectedItems.remove(item) : selectedItems.add(item);
// //This rebuilds the StatefulWidget to update the button's text
// setState(() {});
// //This rebuilds the dropdownMenu Widget to update the check mark
// menuSetState(() {});
// },
// child: Container(
// height: double.infinity,
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Row(
// children: [
// if (isSelected)
// const Icon(Icons.check_box_outlined)
// else
// const Icon(Icons.check_box_outline_blank),
// const SizedBox(width: 16),
// Expanded(
// child: Text(
// item,
// style: const TextStyle(
// fontSize: 14,
// ),
// ),
// ),
// ],
// ),
// ),
// );
// },
// ),
// );
// }).toList()