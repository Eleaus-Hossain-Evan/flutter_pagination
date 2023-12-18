import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../application/item_controller.dart';

class ItemsPage extends HookConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(itemsController.notifier);
    final asyncItem = ref.watch(itemsController);
    final scrollController = useScrollController();

    final refreshController = useRef(RefreshController(initialRefresh: false));

    return Scaffold(
      body: SmartRefresher(
        scrollController: scrollController,
        controller: refreshController.value,
        onRefresh: () => ref.refresh(itemsController.future).then((value) =>
            refreshController.value.refreshCompleted(resetFooterState: true)),
        onLoading: () {
          if (controller.canLoadMore()) {
            controller
                .loadMore()
                .then((value) => refreshController.value.loadComplete());
          } else {
            refreshController.value.loadNoData();
          }
        },
        child: asyncItem.when(
          data: (data) {
            if (data.total == 0 && data.products.isNotEmpty) {
              const Center(
                child: Text("No data"),
              );
            }
            return ListView.builder(
              controller: scrollController,
              itemCount: data.products.length,
              itemBuilder: (context, index) {
                final item = data.products[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.price.toString()),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
