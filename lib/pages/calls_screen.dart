import 'package:flutter/material.dart';

import '../components/components.dart';

class CallsScreen extends StatelessWidget {
  CallsScreen({super.key});

  final List<MenuItemButton> callItem = [
    MenuItemButton(
      child: const Text('Clear call log'),
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(title: 'Calls', menuItem: callItem),
        ],
      ),
    );
  }
}
