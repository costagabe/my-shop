import 'package:flutter/foundation.dart';

class LayoutProvider with ChangeNotifier {
  String _pageTitle = '';

  get pageTitle => _pageTitle;

  set pageTitle(String pageTitle) {
    this._pageTitle = pageTitle;
    notifyListeners();
  }
}
