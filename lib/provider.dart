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
