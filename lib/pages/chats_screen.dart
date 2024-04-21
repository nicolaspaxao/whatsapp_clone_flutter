import 'package:flutter/material.dart';

import '../components/components.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  final List<MenuItemButton> chatsItems = [
    MenuItemButton(
      child: const Text('New group'),
      onPressed: () {},
    ),
    MenuItemButton(
      child: const Text('New broadcast'),
      onPressed: () {},
    ),
    MenuItemButton(
      child: const Text('Linked devices'),
      onPressed: () {},
    ),
    MenuItemButton(
      child: const Text('Starred messagess'),
      onPressed: () {},
    ),
    MenuItemButton(
      child: const Text('Discover businesses'),
      onPressed: () {},
    ),
    MenuItemButton(
      child: const Text('Payments'),
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(title: 'WhatsApp', menuItem: chatsItems),
        ],
      ),
    );
  }
}
