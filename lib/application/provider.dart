import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/product.dart';
import 'package:flutter_app/infrastructure/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

import '../domain/domain.dart';

part 'provider.g.dart';

@riverpod
class ProductList extends _$ProductList {
  final repo = Repo();

  Future<ProductResponse> _fetch(int page) async {
    final result = await repo.fetchProduct(page);
    return result.fold((l) => showErrorToast(l.error.message), (r) => r);
  }

  @override
  FutureOr<ProductResponse> build(int page) {
    return _fetch(page);
  }
}

//A normal riverpod notifier.
@riverpod
class TrendingMoviesList extends _$TrendingMoviesList
    with PaginatedDataMixin<Product>
    implements PaginatedNotifier<Product> {
  @override
  FutureOr<List<Product>> build() async {
    return init(
      dataFetcher: PaginatedDataRepository(
        fetcher: Repo().fetchProductDio,
      ),
    );
  }
}

@riverpod
class DataFetchDio extends _$DataFetchDio
    with PaginatedDataMixin<Model>
    implements PaginatedNotifier<Model> {
  @override
  FutureOr<List<Model>> build() {
    return init(dataFetcher: PaginatedDataRepository(fetcher: Repo().fetchDataDio));
  }
}

@riverpod
class ProductDetail extends _$ProductDetail {
  Future<Product> _fetch(int id) async {
    final result = await Repo().fetchProductDetail(id);
    return result.fold((l) => showErrorToast(l.error.message), (r) => r);
  }

  @override
  FutureOr<Product> build(int id) async {
    return _fetch(id);
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
