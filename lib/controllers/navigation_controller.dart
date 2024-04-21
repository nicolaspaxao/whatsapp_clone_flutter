import 'package:flutter/material.dart';

final navigationCtrl = NavigationController();

enum NavigationTabEnum {
  chats(0, 'Chats'),
  updates(1, 'Updates'),
  communities(2, 'Communities'),
  calls(3, 'Calls');

  const NavigationTabEnum(this.value, this.title);
  final int value;
  final String title;
}

class NavigationController extends ChangeNotifier {
  int selectedIndex = 0;

  PageController controller = PageController();

  void handleChangePage(int val) {
    handleChangeIndex(val);
    controller.jumpToPage(val);
  }

  void handleChangeIndex(int val) {
    selectedIndex = val;
    notifyListeners();
  }
}
