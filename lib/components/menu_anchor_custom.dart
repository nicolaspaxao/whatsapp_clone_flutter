import 'package:flutter/material.dart';

class CustomMenuAnchor extends StatelessWidget {
  const CustomMenuAnchor({super.key, this.menuItem});

  final List<MenuItemButton>? menuItem;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
      menuChildren: [
        ...menuItem ?? [],
        MenuItemButton(
          child: const Text('Settings'),
          onPressed: () {},
        ),
      ],
    );
  }
}
