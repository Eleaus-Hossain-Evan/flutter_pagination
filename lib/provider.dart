import 'dart:async';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/repo.dart';
import 'package:flutter_app/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'domain.dart';

part 'provider.g.dart';

final listProvider = StateNotifierProvider<ListNotifier, ListState>((ref) {
  return ListNotifier();
});

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

showErrorToast(String text) => BotToast.showText(
      text: text,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      duration: const Duration(seconds: 3),
      contentPadding: const EdgeInsets.all(10),
      contentColor: Colors.red,
    );

@riverpod
class FetchData extends _$FetchData {
  final repo = Repo();

  Future<Model> _fetch(String id) async {
    final data = await repo.fetchData(id);
    return data.fold((l) => showErrorToast(l.error.message), (r) => r.data);
  }

  @override
  Future<Model> build({required String parcelId}) {
    return _fetch(parcelId);
  }
}
