import 'package:flutter/material.dart';

import '../components/components.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(title: 'Communities'),
        ],
      ),
    );
  }
}
