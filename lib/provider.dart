import 'dart:developer';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_app/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListNotifier extends StateNotifier<ListState> {
  ListNotifier() : super(ListState.init()) {
    loadData(0);
  }

  Future<List<int>> loadData(int page) async {
    state = state.copyWith(loading: true, list: state.list);
    final list = <int>[];

    await Future.delayed(const Duration(seconds: 2));

    List.generate(10, (index) => list.add((page * 10) + index));
    log('list: $list');

    final newList = state.list.addAll(list.lock);

    state = state.copyWith(loading: false, list: newList);

    return newList.unlock;
  }
}

final listProvider = StateNotifierProvider<ListNotifier, ListState>((ref) {
  return ListNotifier();
});
