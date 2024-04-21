import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/components/app_bar_widget.dart';
import 'package:whatsapp_clone/components/change_theme_button.dart';
import 'package:whatsapp_clone/controllers/navigation_controller.dart';

import '../core/core.dart';
import 'pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    bool isBright = theme.brightness == Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: theme.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          isBright ? Brightness.dark : Brightness.light,
      statusBarColor: theme.scaffoldBackgroundColor,
      statusBarIconBrightness: isBright ? Brightness.dark : Brightness.light,
    ));

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: navigationCtrl.controller,
          onPageChanged: (val) => navigationCtrl.handleChangePage(val),
          children: [
            ChatsScreen(),
            const UpdatesScreen(),
            const CommunitiesScreen(),
            CallsScreen()
          ],
        ),
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: navigationCtrl,
        builder: (_, snapshot) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(top: borderSide(isBright)),
            ),
            child: NavigationBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              selectedIndex: navigationCtrl.selectedIndex,
              destinations: destinations,
              surfaceTintColor: theme.scaffoldBackgroundColor,
              onDestinationSelected: (val) {
                navigationCtrl.handleChangePage(val);
              },
            ),
          );
        },
      ),
    );
  }
}
