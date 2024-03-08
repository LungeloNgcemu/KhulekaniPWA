import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class ProviderSavedOne extends ChangeNotifier {
  bool one;

  ProviderSavedOne({
    this.one = false,
  });

  void changeValue({required bool newValue}) {
    one = newValue;
    notifyListeners();
  }
}

class ProviderSavedTwo extends ChangeNotifier {
  bool two;

  ProviderSavedTwo({
    this.two = false,
  });

  void changeValue({required bool newValue}) {
    two = newValue;
    notifyListeners();
  }
}

class ProviderSavedThree extends ChangeNotifier {
  bool three;

  ProviderSavedThree({
    this.three = false,
  });

  void changeValue({required bool newValue}) {
    three = newValue;
    notifyListeners();
  }
}

class ProviderSavedFour extends ChangeNotifier {
  bool four;

  ProviderSavedFour({
    this.four = false,
  });

  void changeValue({required bool newValue}) {
    four = newValue;
    notifyListeners();
  }
}

class ProviderSavedFive extends ChangeNotifier {
  bool five;

  ProviderSavedFive({
    this.five = false,
  });

  void changeValue({required bool newValue}) {
    five = newValue;
    notifyListeners();
  }
}

class ProviderSavedSix extends ChangeNotifier {
  bool six;

  ProviderSavedSix({
    this.six = false,
  });

  void changeValue({required bool newValue}) {
    six = newValue;
    notifyListeners();
  }
}

///////////////////////////////////////////////////////////////////////////////////

class ProviderSavedSeven extends ChangeNotifier {
  bool seven;

  ProviderSavedSeven({
    this.seven = false,
  });

  void changeValue({required bool newValue}) {
    seven = newValue;
    notifyListeners();
  }
}


class ProviderSavedEight extends ChangeNotifier {
  bool eight;

  ProviderSavedEight({
    this.eight = false,
  });

  void changeValue({required bool newValue}) {
    eight = newValue;
    notifyListeners();
  }
}

class ProviderSavedNine extends ChangeNotifier {
  bool nine;

  ProviderSavedNine({
    this.nine = false,
  });

  void changeValue({required bool newValue}) {
    nine = newValue;
    notifyListeners();
  }
}