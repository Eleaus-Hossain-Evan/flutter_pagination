import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'scroll_hook_async_base/presentation/items_screen.dart';
import 'listview_custom_index/presentation/list_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ListScreen(),
                ),
              ),
              child: const Text('Go to list screen'),
            ),
          ),
          Center(
            child: FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ItemsPage(),
                ),
              ),
              child: const Text('Go to Items screen'),
            ),
          ),
        ],
      ),
    );
  }
}
