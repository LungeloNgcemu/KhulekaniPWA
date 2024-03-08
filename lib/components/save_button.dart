import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  SaveButton({this.onPressed,this.color,this.text, super.key});

  VoidCallback? onPressed;
  Color? color;
  String? text;

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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: color ?? Colors.green[500],
                  onPressed: onPressed ?? () {},
                  child: Text(
                    text ?? "Save",
                    style:
                    const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
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
