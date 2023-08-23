import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/product.dart';
import 'package:flutter_app/repo.dart';
import 'package:flutter_app/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import 'domain/domain.dart';

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

@riverpod
class ProductList extends _$ProductList {
  Future<ProductResponse> _fetch() async {
    final json = await http
        .get(Uri.parse('https://dummyjson.com/products?limit=10&skip=20'));
    final products = ProductResponse.fromJson(json.body);
    return products;
  }

  @override
  FutureOr<ProductResponse> build() {
    return _fetch();
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
