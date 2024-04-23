import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_clone/controllers/controller.dart';
import 'package:whatsapp_clone/controllers/navigation_controller.dart';
import 'package:whatsapp_clone/core/core.dart';
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
      floatingActionButton: ListenableBuilder(
        listenable: navigationCtrl,
        builder: (_, __) {
          return navigationCtrl.selectedIndex !=
                  NavigationTabEnum.communities.value
              ? const _FloatingActions()
              : const SizedBox();
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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

class _FloatingActions extends StatefulWidget {
  const _FloatingActions();

  @override
  State<_FloatingActions> createState() => _FloatingActionsState();
}

class _FloatingActionsState extends State<_FloatingActions>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Offset> offsetAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 150),
    )..addListener(() {
        setState(() {});
      });

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 55),
      end: const Offset(0, -10),
    ).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: navigationCtrl,
      builder: (context, snapshot) {
        if (navigationCtrl.selectedIndex == NavigationTabEnum.updates.value) {
          controller.forward();
        } else {
          controller.reverse();
        }
        return SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.translate(
                offset: Offset(-5, offsetAnimation.value.dy),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.grey,
                  onPressed: () {/* NOT WORKING */},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: FaIcon(
                  switch (navigationCtrl.selectedIndex) {
                    0 => FontAwesomeIcons.commentMedical,
                    1 => FontAwesomeIcons.camera,
                    3 => FontAwesomeIcons.phone,
                    int() => FontAwesomeIcons.commentMedical,
                  },
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
