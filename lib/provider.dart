import 'dart:developer';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_app/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListNotifier extends StateNotifier<ListState> {
  ListNotifier() : super(ListState.init()) {
    loadData(0);
  }

  void loadData(int page) async {
    final list = <int>[];
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    List.generate(10, (index) => list.add((page * 10) + index));
    log('list: $list');

    state = state.copyWith(
      isLoading: false,
      list: state.list.addAll(list.lock),
    );
  }
}

final listProvider = StateNotifierProvider<ListNotifier, ListState>((ref) {
  return ListNotifier();
});
