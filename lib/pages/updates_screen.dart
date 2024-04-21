import 'package:flutter/material.dart';

import '../components/components.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(title: 'Updates'),
        ],
      ),
    );
  }
}
