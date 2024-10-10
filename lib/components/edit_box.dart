import 'package:flutter/material.dart';
import 'package:khulekani_app/classes/alert.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/questionTextStrip.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/provider_answers.dart';
import '../world_view.dart';

class EditBox extends StatefulWidget {
  const EditBox(
      {this.data, this.heading, this.index, this.listIndex,this.needCall, super.key});

  final String? heading;
  final String? data;
  final String? index;
  final int? listIndex;
  final VoidCallback? needCall;

  @override
  State<EditBox> createState() => _EditBoxState();
}

class _EditBoxState extends State<EditBox> {
  late final TextEditingController controller;
  final supabase = Supabase.instance.client;
  AlertPop pop = AlertPop();

  Future<void> update(BuildContext context, String head, String infor, int index, int point) async {
    try {
      await supabase
          .from('Information')
          .update({head: infor}).eq('Information Id', index);
      print("Updated1");

      updateProvider(point, index, head, infor);

      // await pop.alert(context, "Update Complete");
      await pop.alert2(context, "Update Complete", widget.needCall ?? (){});

      MaterialPageRoute(builder: (context) => const WorldView());
      Navigator.of(context).pop();
      print("Updated2");
    } catch (error) {
      pop.alert(context, "Error");
      pop.alert(context, "Error");
      print("Update error : $error");
    }
  }

  void updateProvider(int indexPoint, int id, String key, String data) {
    // Retrieve the current list from the provider
    final List<Map<String, dynamic>> currentList =
        Provider.of<TableListProvider>(context, listen: false).list;

    // Create a new map with updated data
    var newMap = {
      "id": id,
      "heading": key,
      "info": data,
    };



    // Make a copy of the list to avoid direct modification
    List<Map<String, dynamic>> updatedList = List.from(currentList);
    // Replace the item at the specified index with the new map
    updatedList[indexPoint] = newMap;

    // Update the provider with the new list
    context.read<TableListProvider>().updateTableList(newList: updatedList);

    print("Providr Provider Update");
    print(newMap);
  }

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController(text: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    int intIndex = int.tryParse(widget.index ?? '') ?? 0;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        color: Colors.grey[50],
        height: h * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderBlue(
              text: "Edit Detail",
            ),
            QuestionTextStrip(
              text: widget.heading ?? "",
              controller: controller,
            ),
            SaveButton(
              color: Colors.blueAccent,
              text: 'Update',
              onPressed: () async {
                await update(context, widget.heading ?? "", controller.text, intIndex, widget.listIndex ?? 0);
                print(
                    "this is heading :${widget.heading} and this is control : ${controller.text} and this ois index : ${intIndex} ");
                //controller vallue here

                // Provider.of<ProviderIsDetails>(context,listen: false).isDetails;
                 context.read<ProviderIsDetails>().changeValue(newValue: false);

                print(
                    "ISdetails ${Provider.of<ProviderIsDetails>(context, listen: false).isDetails}");



                void stateChange() {
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {});
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
