import 'package:flutter/material.dart';
import 'package:flutter_app/application/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';

class ItemsPage extends HookConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Generator Items Page")),
      body: PaginatedListView(
        state: ref.watch(dataFetchDioProvider),
        itemBuilder: (context, model) => ListTile(
          title: Text(
            model.merchantInfo.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            model.serialId,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          trailing: Text("\$${model.regularParcelInfo.productPrice}"),
        ),
        notifier: ref.read(dataFetchDioProvider.notifier),
      ),
    );
  }
}
