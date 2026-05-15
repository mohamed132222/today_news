import 'package:flutter/material.dart';

mixin SafeNotifyMixin on ChangeNotifier {
  bool isDispose = false;
  void safeNotify() {
    if (!isDispose) notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isDispose = true;
  }
}
