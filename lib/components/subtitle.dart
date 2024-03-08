import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  SubTitle({this.title,super.key});

  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    title ??"",
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}

class SubTitle2 extends StatelessWidget {
  SubTitle2({this.title,super.key});

  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 8.0, top: 8.0, bottom: 8.0),
                child: Text(
                  title ??"",
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}

