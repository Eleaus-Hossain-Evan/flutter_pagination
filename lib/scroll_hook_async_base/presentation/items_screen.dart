import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../utility/custom_hook.dart';
import '../application/item_controller.dart';

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
        appBar: AppBar(
          title: const Text("Items Page"),
        ),
        body: asyncItem.when(
          data: (data) => data.data.isNotEmpty
              ? ListView.builder(
                  controller: scrollController,
                  itemCount: data.data.length +
                      (asyncItem.isLoading ||
                              asyncItem.hasError ||
                              !controller.canLoadMore()
                          ? 1
                          : 0),
                  itemBuilder: (context, index) {
                    if (data.data.length == index) {
                      // here we will handle isLoading and hasError and done
                      if (asyncItem.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (asyncItem.hasError) {
                        return Center(child: Text(asyncItem.error.toString()));
                      }
                      if (!controller.canLoadMore()) {
                        return const Center(child: Text("No more data"));
                      }
                    }
                    final item = data.data[index];

                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.price.toString()),
                      trailing: Image.network(item.images.first),
                    );
                  },
                )
              : const Center(
                  child: Text("No data"),
                ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
