import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_clone/controllers/navigation_controller.dart';
import 'package:whatsapp_clone/core/app_theme.dart';

List<NavigationDestination> destinations = [
  NavigationDestination(
    tooltip: '',
    icon: Badge.count(
      backgroundColor: AppTheme.colorSeed,
      count: 1000,
      child: const FaIcon(FontAwesomeIcons.comment),
    ),
    label: NavigationTabEnum.values[0].title,
    selectedIcon: Badge.count(
      backgroundColor: AppTheme.colorSeed,
      count: 1000,
      child: const FaIcon(FontAwesomeIcons.solidComment),
    ),
  ),
  NavigationDestination(
    tooltip: '',
    icon: const Icon(Icons.now_widgets_outlined),
    label: NavigationTabEnum.values[1].title,
    selectedIcon: const Icon(Icons.now_widgets),
  ),
  NavigationDestination(
    tooltip: '',
    icon: const Icon(Icons.people_alt_outlined),
    label: NavigationTabEnum.values[2].title,
    selectedIcon: const Icon(Icons.people_alt_rounded),
  ),
  NavigationDestination(
    tooltip: '',
    icon: const Icon(Icons.phone_outlined),
    label: NavigationTabEnum.values[3].title,
    selectedIcon: const Icon(Icons.phone),
  )
];

BorderSide borderSide(bool isBright) => BorderSide(
      width: 1,
      color: !isBright
          ? const Color.fromARGB(12, 255, 255, 255)
          : const Color.fromARGB(12, 0, 0, 0),
    );
