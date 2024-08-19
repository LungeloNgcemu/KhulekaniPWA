import 'package:flutter/material.dart';
import 'package:khulekani_app/blue_print.dart';
import 'package:khulekani_app/classes/table_class.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:khulekani_app/components/search_strip.dart';
import 'package:khulekani_app/components/table.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  List<Map<String, dynamic>> data2 = [];

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
        return DataRow(cells: [
          DataCell(Text(item['Identity Number'].toString())),
          DataCell(Text(birthday ?? '')),
          DataCell(Text(item['Head of Household'] ?? '')),
          DataCell(Text(
              item['Specify street address where possible/applicable'] ?? '')),
          DataCell(
              Text("${item['Longitude (E)']}\n ${item['Latitude (S)']}" ?? '')),
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
      child: Column(
        children: [
          HeaderBlue(
            text: 'View Beneficiary',
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
                      stream: stream as Stream<List<Map<String, dynamic>>>,
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
                          return const Center(child: Text('No data available'));
                        } else {
                          final data = snapshot.data!;
                          print(data);
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
                              //use the pass the item['Identity Number'] into a function and get birth date
                              final birthday =
                                  table.birthday(item['Identity Number']);
                              print(birthday);
                              return DataRow(cells: [
                                DataCell(
                                    Text(item['Identity Number'].toString())),
                                DataCell(Text(birthday ?? '')),
                                DataCell(Text(item['Head of Household'] ?? '')),
                                DataCell(Text(item[
                                        'Specify street address where possible/applicable'] ??
                                    '')),
                                DataCell(Text(
                                    "${item['Longitude (E)']}\n ${item['Latitude (S)']}" ??
                                        '')),
                                DataCell(Text(item['Contact Number'] ?? '')),
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
