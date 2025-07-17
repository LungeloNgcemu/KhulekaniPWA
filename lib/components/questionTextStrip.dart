import 'package:flutter/material.dart';

class QuestionTextStrip extends StatelessWidget {
  QuestionTextStrip({
    this. controller,
    this.onChanged,
    this.text,
    super.key,
  });

  String? text;
  void Function(String)? onChanged;
  TextEditingController? controller;
  //The argument type 'void Function()' can't be assigned to the parameter type 'TextEditingController?'.

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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    text ?? "",
                    style: TextStyle(fontSize: 25.0),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 50,
                  width: 20,
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 25.0, // Set your desired font size here
                      color: Colors.black, // Set your desired text color here
                    ),
                    onChanged: onChanged ?? (String) {},
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      // hintText: "hello",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),

                      ),
                    ),
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
