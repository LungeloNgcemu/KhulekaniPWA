import 'package:flutter/material.dart';
import 'package:khulekani_app/classes/sheet_class.dart';

// import 'package:khulekani_app/blue_print.dart';
import 'package:khulekani_app/classes/table_class.dart';
import 'package:khulekani_app/components/edit_box.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:khulekani_app/components/search_strip.dart';
import 'package:khulekani_app/components/styles.dart';
import 'package:khulekani_app/components/table.dart';
import 'package:khulekani_app/pages/details.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../providers/provider_answers.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  TableTable table = TableTable();
  TextEditingController searchController = TextEditingController();
  Stream? stream;
  Stream? streamSearch;
  bool isSearch = false;

  // bool isDetails = false;

  List<Map<String, dynamic>> data2 = [];
  Map<String, dynamic>? selectedItem;

  @override
  void initState() {
    super.initState();
    streamInit();
  }

  final supabase = Supabase.instance.client;

  Stream<List<Map<String, dynamic>>> startStream() {
    return supabase.from('Information').stream(primaryKey: ['id']).limit(50);
  }

  Stream<List<Map<String, dynamic>>> startStream2(value) {
    return supabase
        .from('Information')
        .stream(primaryKey: ['id'])
        .gte("Identity Number", value)
        .limit(50);
  }

  void switchStream(search, item) {
    switch (search) {
      case false:
        stream = startStream();
        setState(() {});
        break;
      case true:
        stream = startStream2(item);
        setState(() {});
    }
  }

  Future<void> likeSearch(String id) async {
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase.from('Information').select().ilike(
          'Identity Number', '%$id%'); // Perform a case-insensitive searc
      setState(() {
        data2 = response;
      });
    } catch (error) {
      print("Like error : $error");
    }
  }

  void streamInit() {
    stream = startStream();
  }

  Widget likeResultTable(List<Map<String, dynamic>> data) {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: const [
        DataColumn2(
          label: Text('ID Number'),
          size: ColumnSize.L,
        ),
        DataColumn(
          label: Text('Date of Birth'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Address'),
        ),
        DataColumn(
          label: Text('Co-ordinates'),
        ),
        DataColumn(
          label: Text('Contact'),
        ),
      ],
      rows: data.map((item) {
        final birthday = table.birthday(item['Identity Number']);
        return DataRow(
            onLongPress: () {
              setState(() {
                context.read<ProviderIsDetails>().changeValue(newValue: true);
                selectedItem = item;
              });
            },
            cells: [
              DataCell(Text(item['Identity Number'].toString())),
              DataCell(Text(birthday ?? '')),
              DataCell(Text(item['Head of Household'] ?? '')),
              DataCell(Text(
                  item['Specify street address where possible/applicable'] ??
                      '')),
              DataCell(Text(
                  "${item['Longitude (E)']}\n ${item['Latitude (S)']}" ?? '')),
              DataCell(Text(item['Contact Number'] ?? '')),
            ]);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Provider.of<ProviderIsDetails>(context, listen: false).isDetails
          ? DetailsScreen(
              needCall: () {
                setState(() {
                  context
                      .read<ProviderIsDetails>()
                      .changeValue(newValue: false);
                });

                Navigator.pop(context);
              },
              item: selectedItem,
              call: () {
                setState(() {
                  context
                      .read<ProviderIsDetails>()
                      .changeValue(newValue: false);
                  print(
                      "ISdetails ${Provider.of<ProviderIsDetails>(context, listen: false).isDetails}");
                });
              },
            )
          : Column(
              children: [
                Column(
                  children: [
                    HeaderBlue(
                      text: 'View Beneficiary',
                    ),
                  ],
                ),
                SearchStrip(
                  text: "Benificiary ID number",
                  controller: searchController,
                  onChanged: (value) {
                    isSearch = value.isNotEmpty;
                    switchStream(isSearch, value);
                    likeSearch(value);
                  },
                ),
                Container(
                  color: Colors.white,
                  height: h * 0.655,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: isSearch
                        ? likeResultTable(data2)
                        : StreamBuilder<List<Map<String, dynamic>>>(
                            stream:
                                stream as Stream<List<Map<String, dynamic>>>,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child: Text('Error loading data'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text('No data available'));
                              } else {
                                final data = snapshot.data!;
                                print(data);
                                return DataTable2(
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  minWidth: 600,
                                  columns: const [
                                    DataColumn2(
                                      label: Text(
                                        'ID Number',
                                        style: TextStyle(fontSize: kFontDmi),
                                      ),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn(
                                      label: Text('Date of Birth',
                                          style: TextStyle(fontSize: kFontDmi),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('Name'),
                                    ),
                                    DataColumn(
                                      label: Text('Address'),
                                    ),
                                    DataColumn(
                                      label: Text('Co-ordinates'),
                                    ),
                                    DataColumn(
                                      label: Text('Contact'),
                                    ),
                                  ],
                                  rows: data.map((item) {
                                    //use the pass the item['Identity Number'] into a function and get birth date
                                    final birthday =
                                        table.birthday(item['Identity Number']);
                                    print(birthday);
                                    return DataRow(
                                        onLongPress: () {
                                          setState(() {
                                            // isDetails = true;
                                            context
                                                .read<ProviderIsDetails>()
                                                .changeValue(newValue: true);
                                            print(
                                                "ISdetails ${Provider.of<ProviderIsDetails>(context, listen: false).isDetails}");
                                            selectedItem = item;
                                          });
                                        },
                                        cells: [
                                          DataCell(Text(item['Identity Number']
                                              .toString())),
                                          DataCell(Text(birthday ?? '')),
                                          DataCell(Text(
                                              item['Head of Household'] ?? '')),
                                          DataCell(Text(item[
                                                  'Specify street address where possible/applicable'] ??
                                              '')),
                                          DataCell(Text(
                                              "${item['Longitude (E)']}\n ${item['Latitude (S)']}" ??
                                                  '')),
                                          DataCell(Text(
                                              item['Contact Number'] ?? '')),
                                        ]);
                                  }).toList(),
                                );
                              }
                            },
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? item;

  const DetailsScreen({super.key, this.item, this.call, this.needCall});

  final VoidCallback? call;
  final VoidCallback? needCall;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void convertDetails(BuildContext context, Map<String, dynamic> item) {
    final List<Map<String, dynamic>> list = [];
    var id;
    // Iterate over the keys of the item map
    for (var key in item.keys) {
      if (key == "Information Id") {
        id = item[key]?.toString();
      }
      // Add each key-value pair to the list with 'heading' and 'info'
      // use the provider
      list.add({
        'id': id,
        'heading': key,
        'info': item[key]?.toString() ??
            '', // Convert the value to a string, default to empty if null
      });
    }

    context.read<TableListProvider>().updateTableList(newList: list);

    // Print the list to verify the result (or use it as needed)
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    convertDetails(context, widget.item ?? {});
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        HeaderBlueNav(
          text: 'Beneficiary Details',
          call: widget.call ?? () {},
        ),
        Container(
          height: h * 0.755,
          color: Colors.grey[100],
          child: widget.item != null
              ? buildTable(
                  context,
                  Provider.of<TableListProvider>(context, listen: false).list,
                  widget.needCall ?? () {})
              : Center(child: Text('No data available')),
        ),
      ],
    );
  }
}

Widget buildTable(
    context, List<Map<String, dynamic>> data, VoidCallback needCall) {
  CreateClass create = CreateClass();

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Table(
      children: data.map(
        (item) {
          var id;
          bool isId = item['heading'] == "Information Id";
          int indexPoint = data
              .indexWhere((element) => element['heading'] == item['heading']);

          return isId
              ? TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        item['heading'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ), // Accessing the 'info' key
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    item['info'], // Accessing the 'heading' key
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Positioned(
                          //   right: 0,
                          //   bottom: 0,
                          //   top: 0.3,
                          //   child: Container(
                          //     height: 10,
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.5),
                          //             // Shadow color
                          //             spreadRadius: 1,
                          //             // Spread radius
                          //             blurRadius: 5,
                          //             // Blur radius
                          //             offset: const Offset(
                          //                 0, 3), // Offset in x and y direction
                          //           )
                          //         ]),
                          //     child: IconButton(
                          //       onPressed: () {},
                          //       icon: const Icon(size: 15.0, Icons.edit),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              : TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        item['heading'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), // Accessing the 'info' key
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.grey[200],
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    item['info'], // Accessing the 'heading' key
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 5,
                            bottom: 0,
                            top: 0.3,
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      // Shadow color
                                      spreadRadius: 1,
                                      // Spread radius
                                      blurRadius: 5,
                                      // Blur radius
                                      offset: const Offset(
                                          0, 3), // Offset in x and y direction
                                    )
                                  ]),
                              child: IconButton(
                                onPressed: () {
                                  //edit drawer
                                  create.sheeting(
                                      context,
                                      EditBox(
                                        //pass in the list index
                                        heading: item["heading"],
                                        data: item["info"],
                                        index: item["id"],
                                        listIndex: indexPoint,
                                        needCall: needCall!,
                                      ));
                                },
                                icon: const Icon(size: 15.0, Icons.edit),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ).toList(),
    ),
  );
}

class HeaderBlueNav extends StatefulWidget {
  const HeaderBlueNav({this.text, this.call, super.key});

  final String? text;
  final VoidCallback? call;

  @override
  State<HeaderBlueNav> createState() => _HeaderBlueNavState();
}

class _HeaderBlueNavState extends State<HeaderBlueNav> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderBlue(
          text: widget.text ?? "",
        ),
        Row(
          children: [
            IconButton(
              onPressed: widget.call ?? () {},
              icon: const Icon(
                color: Colors.black,
                Icons.arrow_back_ios,
              ),
            ),
            const Text(
              "Back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }
}
