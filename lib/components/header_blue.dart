import 'package:flutter/material.dart';

class HeaderBlue extends StatelessWidget {
  HeaderBlue({
    this.text,
    super.key,
  });
  String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  text ??"",
                  style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
