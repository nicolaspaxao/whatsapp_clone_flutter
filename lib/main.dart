import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/controllers/navigation_controller.dart';

import 'controllers/theme_controller.dart';
import 'core/core.dart';
import 'pages/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeController>(create: (_) => ThemeController()),
        Provider<NavigationController>(create: (_) => NavigationController()),
      ],
      child: ListenableBuilder(
        listenable: themeCtrl,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeAnimationCurve: Curves.easeInOut,
            themeMode: themeCtrl.themeMode,
            darkTheme: AppTheme.dark(),
            theme: AppTheme.light(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
