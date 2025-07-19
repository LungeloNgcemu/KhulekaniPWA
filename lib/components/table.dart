import 'dart:math';
import 'package:dynamic_table/dynamic_table.dart';
import 'package:flutter/material.dart';
import 'package:khulekani_app/list/lists.dart' as collection;
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TableT extends StatefulWidget {
  const TableT({
    Key? key,
  }) : super(key: key);

  @override
  State<TableT> createState() => _TableTState();
}

class _TableTState extends State<TableT> {
  List<List<dynamic>> dummyData = [];

  var tableKey = GlobalKey<DynamicTableState>();
  late List<List<dynamic>> myData;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    //print(dummyData);
    myData = dummyData;
    print(myData);
  }

  void tableUpdate() {
    context.read<ProviderFortyTwo>().changeValue(newValue: myData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width * 0.5),
          child: DynamicTable(
            key: tableKey,
            header: const Text("Scholars effected"),
            onRowEdit: (index, row) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Row Edited index:$index row:$row"),
                ),
              );
              myData[index] = row;
              return true;
            },
            onRowDelete: (index, row) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Row Deleted index:$index row:$row"),
                ),
              );
              myData.removeAt(index);
              return true;
            },
            onRowSave: (index, old, newValue) {
              if (newValue[1] == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Birth Date cannot be null"),
                  ),
                );
                return null;
              }

              // Treat null birth date as zero (epoch time)
              if (newValue[1] == null) {
                newValue[1] = DateTime(0);
              }

              if (newValue[0] == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name cannot be null"),
                  ),
                );
                return null;
              }

              if (newValue[0].toString().length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name must be atleast 3 characters long"),
                  ),
                );
                return null;
              }
              if (newValue[0].toString().length > 20) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name must be less than 20 characters long"),
                  ),
                );
                return null;
              }
              if (newValue[1] == null) {
                //If newly added row then add unique ID
                newValue[1] = Random()
                    .nextInt(500)
                    .toString(); // to add Unique ID because it is not editable
              }
              // myData[index] = newValue; // Update data ..this line is not needed.
              if (newValue[0] == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Name cannot be null"),
                  ),
                );
                return [];
              }
              myData.add(newValue);
              print("THIS IT $newValue");
              print("LIST : $myData");
              return newValue;
            },
            showActions: true,
            showAddRowButton: true,
            showDeleteAction: true,
            rowsPerPage: 5,
            showFirstLastButtons: true,
            availableRowsPerPage: const [
              5,
              10,
              15,
              20,
            ],
            dataRowMinHeight: 60,
            dataRowMaxHeight: 60,
            columnSpacing: 60,
            actionColumnTitle: "My Action Title",
            showCheckboxColumn: true,
            onSelectAll: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: value ?? false
                      ? const Text("All Rows Selected")
                      : const Text("All Rows Unselected"),
                ),
              );
            },
            onRowsPerPageChanged: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Rows Per Page Changed to $value"),
                ),
              );
            },
            actions: [
              IconButton(
                onPressed: () {
                  for (var i = 0; i < myData.length; i += 2) {
                    tableKey.currentState?.selectRow(i, isSelected: true);
                  }
                },
                icon: const Icon(Icons.select_all),
                tooltip: "Select all odd Values",
              ),
              IconButton(
                onPressed: () {
                  for (var i = 0; i < myData.length; i += 2) {
                    tableKey.currentState?.selectRow(i, isSelected: false);
                  }
                },
                icon: const Icon(Icons.deselect_outlined),
                tooltip: "Unselect all odd Values",
              ),
            ],
            rows: List.generate(
              myData.length,
              (index) => DynamicTableDataRow(
                onSelectChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: value ?? false
                          ? Text("Row Selected index:$index")
                          : Text("Row Unselected index:$index"),
                    ),
                  );
                },
                index: index,
                cells: List.generate(
                  myData[index].length,
                  (cellIndex) => DynamicTableDataCell(
                    value: myData[index][cellIndex],
                  ),
                ),
              ),
            ),
            columns: [
              //1
              DynamicTableDataColumn(
                  label: Container(
                      color: Colors.green,
                      child: const Text("Name and Surname")),
                  onSort: (columnIndex, ascending) {},
                  dynamicTableInputType: DynamicTableInputType.text()),
              //2
              DynamicTableDataColumn(
                label: const Text("Birth Date"),
                onSort: (columnIndex, ascending) {},
                dynamicTableInputType: DynamicTableInputType.date(
                  context: context,
                  decoration: const InputDecoration(
                      hintText: "Select Birth Date",
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder()),
                  initialDate: DateTime(1900),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                ),
              ),
              //3
              DynamicTableDataColumn(
                label: const Text("Gender"),
                dynamicTableInputType: DynamicTableInputType.dropDown<String>(
                  items: collection.gender
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(growable: false),
                  selectedItemBuilder: (context) {
                    return collection.gender
                        .map((e) => Text(e))
                        .toList(growable: false);
                  },
                  decoration: const InputDecoration(
                      hintText: "Select Gender", border: OutlineInputBorder()),
                  displayBuilder: (value) =>
                      value ??
                      "", // How the string will be displayed in non editing mode
                ),
              ),
              //4
              DynamicTableDataColumn(
                label: const Text("Age"),
                dynamicTableInputType: DynamicTableInputType.dropDown<String>(
                  items: collection.numbers20
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(growable: false),
                  selectedItemBuilder: (context) {
                    return collection.numbers20
                        .map((e) => Text(e))
                        .toList(growable: false);
                  },
                  decoration: const InputDecoration(
                      hintText: "Select Age", border: OutlineInputBorder()),
                  displayBuilder: (value) =>
                      value ??
                      "", // How the string will be displayed in non editing mode
                ),
              ),

              //5
              DynamicTableDataColumn(
                label: const Text("School Nane"),
                onSort: (columnIndex, ascending) {},
                dynamicTableInputType: DynamicTableInputType.text(
                  decoration: const InputDecoration(
                    hintText: "Enter School Name",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 100,
                ),
              ),
//////////////////////////////////////////////
              //6
              DynamicTableDataColumn(
                label: const Text("Grade"),
                dynamicTableInputType: DynamicTableInputType.dropDown<String>(
                  items: collection.grades
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(growable: false),
                  selectedItemBuilder: (context) {
                    return collection.numbers20
                        .map((e) => Text(e))
                        .toList(growable: false);
                  },
                  decoration: const InputDecoration(
                      hintText: "Select Grade", border: OutlineInputBorder()),
                  displayBuilder: (value) =>
                      value ??
                      "", // How the string will be displayed in non editing mode
                ),
              ),
//7
              DynamicTableDataColumn(
                label: const Text("Shoe Size"),
                dynamicTableInputType: DynamicTableInputType.dropDown<String>(
                  items: collection.numbers20
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(growable: false),
                  selectedItemBuilder: (context) {
                    return collection.numbers20
                        .map((e) => Text(e))
                        .toList(growable: false);
                  },
                  decoration: const InputDecoration(
                      hintText: "Select Shoe size",
                      border: OutlineInputBorder()),
                  displayBuilder: (value) =>
                      value ??
                      "", // How the string will be displayed in non editing mode
                ),
              ),
              //8
              DynamicTableDataColumn(
                label: const Text("Uniform Size"),
                dynamicTableInputType: DynamicTableInputType.dropDown<String>(
                  items: collection.numbers20
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(growable: false),
                  selectedItemBuilder: (context) {
                    return collection.numbers20
                        .map((e) => Text(e))
                        .toList(growable: false);
                  },
                  decoration: const InputDecoration(
                      hintText: "Select Uniform Size",
                      border: OutlineInputBorder()),
                  displayBuilder: (value) =>
                      value ??
                      "", // How the string will be displayed in non editing mode
                ),
              ),
//////////////////////////////////////////////////
              //9
              DynamicTableDataColumn(
                label: const Text("Other Info"),
                onSort: (columnIndex, ascending) {},
                dynamicTableInputType: DynamicTableInputType.text(
                  decoration: const InputDecoration(
                    hintText: "Enter Other Info",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 100,
                ),
              ),
            ],
          ),
        ),
        SaveButton(
          ///////////////////////////////////////////

          color: isSaved == false ? Colors.red : Colors.green[500],
          onPressed: () {
            tableUpdate();
            Future<bool?> saveData() {
              setState(() {
                isSaved = true;
              });
              // items here
              print(myData);
              return Alert(
                context: context,
                type: AlertType.success,
                title: "Saved",
                desc: "Your Data has been Saved.",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ).show();
            }

            saveData();
          },
          ///////////////////////////////////////////
        ),
      ],
    );
  }
}
