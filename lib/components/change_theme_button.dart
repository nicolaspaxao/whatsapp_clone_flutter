import 'package:flutter/material.dart';

import 'package:whatsapp_clone/controllers/controller.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBright = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      onPressed: () => themeCtrl.handleChange(!isBright),
      icon: const Icon(Icons.light_mode),
    );
  }
}
