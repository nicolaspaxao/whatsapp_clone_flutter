import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/controllers/navigation_controller.dart';

import '../core/core.dart';
import 'components.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title, this.menuItem});

  final String title;
  final List<MenuItemButton>? menuItem;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isBright = theme.brightness == Brightness.light;

    return SliverAppBar(
      shape: Border(
        bottom: borderSide(isBright),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      scrolledUnderElevation: 0,
      forceElevated: true,
      shadowColor: !isBright ? Colors.white : Colors.black54,
      title: Text(title, style: theme.textTheme.titleLarge),
      floating: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt_outlined),
        ),
        ListenableBuilder(
          listenable: navigationCtrl,
          builder: (_, snapshot) {
            if (navigationCtrl.selectedIndex !=
                NavigationTabEnum.communities.value) {
              return IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        CustomMenuAnchor(menuItem: menuItem),
      ],
    );
  }
}
