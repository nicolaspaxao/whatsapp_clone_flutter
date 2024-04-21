import 'package:flutter/material.dart';
import 'package:whatsapp_clone/controllers/navigation_controller.dart';

List<NavigationDestination> destinations = [
  NavigationDestination(
    tooltip: '',
    icon: Badge.count(
      backgroundColor: Colors.green,
      count: 1000,
      child: const Icon(Icons.chat_outlined),
    ),
    label: NavigationTabEnum.values[0].title,
    selectedIcon: Badge.count(
      backgroundColor: Colors.green,
      count: 1000,
      child: const Icon(Icons.chat),
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
