import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../application/custom_hook.dart';
import '../application/item_controller.dart';
import '../domain/pagination_request.dart';

class ItemsPage extends HookConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(itemsController.notifier);
    final asyncItem = ref.watch(itemsController);
    final scrollController =
        usePagination(controller.loadMore, () => controller.canLoadMore());

    final refreshController = useMemoized(RefreshController.new);

    return Scaffold(
      body: asyncItem.when(
        data: (data) {
          return SmartRefresher(
            controller: refreshController,
            onRefresh: () async {
              await ref.refresh(itemsController.future).then((value) =>
                  refreshController.refreshCompleted(resetFooterState: true));
            },
            onLoading: () async {
              if (controller.canLoadMore()) {
                await ref.read(itemsController.notifier).loadData(
                    PaginationRequest(
                        limit: 20, skip: asyncItem.requireValue.skip + 20));
                refreshController.loadComplete();
              } else {
                refreshController.loadNoData();
              }
            },
            child: data.total == 0 && data.products.isNotEmpty
                ? const Center(
                    child: Text("No data"),
                  )
                : ListView.builder(
                    // controller: scrollController,
                    itemCount: data.products.length,
                    itemBuilder: (context, index) {
                      final item = data.products[index];
                      return ListTile(
                        title: Text(item.title),
                        subtitle: Text(item.price.toString()),
                      );
                    },
                  ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
