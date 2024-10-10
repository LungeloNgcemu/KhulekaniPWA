import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

import '../data_base.dart  ';

class AlertPop {

  Future<bool?> alert(BuildContext context, String title) async {
    return Alert(
      context: context,
      type: AlertType.success,
      title: title,
      //desc: "Data base is available",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  Future<bool?> alert2(BuildContext context, String title, VoidCallback callSetState) async {
    return Alert(
      context: context,
      type: AlertType.success,
      title: title,
      //desc: "Data base is available",
      buttons: [
        DialogButton(
          onPressed: callSetState ?? (){},
          width: 120,
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  Future<bool?> alertExit(BuildContext context, String title, VoidCallback callSetState) async {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      // desc: "Eci",
      buttons: [
        DialogButton(
          onPressed: callSetState ?? (){},
          width: 120,
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

}



