import 'dart:developer';

import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool homePageGridView = false;

  void changeHomePageView() {
    homePageGridView = !homePageGridView;

    log(homePageGridView.toString());
    notifyListeners();
  }
}
