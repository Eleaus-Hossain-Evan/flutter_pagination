import 'package:flutter/material.dart';
import 'package:flutter_app/application/paging_async_notifier.dart';
import 'package:flutter_app/async_value_extension.dart';
import 'package:flutter_app/domain/paging_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Generic widget for paging
///
/// Main features
/// 1. If there is data, display the widget created with [contentBuilder]
/// 2. Display CircularProgressIndicator while one page is loading
/// 3. Display the error widget when there is an error on the first page
/// 4. Display error in snack bar in case of error
/// 5. When the last item is displayed, load the next page
/// 6. Supports Pull to Refresh

class CommonPagingView<
    N extends PagingAsyncNotifier<D>,
    D extends PagingData<I>,
    I extends PagingDataItem> extends HookConsumerWidget {
  /// Specify the Provider of the class that implements [PagingAsyncNotifier]
  final AutoDisposeAsyncNotifierProvider<N, D> provider;

  /// Specify a function that returns the widget to display if there is data
  /// [endItem] is a widget to detect that the last displayed item has been displayed, and displays it at the end of the list when it is non null.
  final Widget Function(D data, Widget? endItem) contentBuilder;
  const CommonPagingView({
    required this.provider,
    required this.contentBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Error display by snackbar
    ref.listen(provider, (_, state) {
      state.showSnackbarOnError(context);
    });

    return ref.watch(provider).whenPlus(
          data: (data, hasError) {
            return RefreshIndicator(
              onRefresh: () => ref.refresh(provider.future),
              child: contentBuilder(
                data,
                //Display a widget to detect when the last element has been reached if there is a next page and there are no errors
                data.hasMore && !hasError
                    ? EndItem(
                        onScrollEnd: () =>
                            ref.read(provider.notifier).loadNext(),
                      )
                    : null,
              ),
            );
          },
          // Loading the first page
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          // Error on page 1
          error: (e, st) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => ref.read(provider.notifier).forceRefresh(),
                  icon: const Icon(Icons.refresh),
                ),
                Text(e.toString()),
              ],
            ),
          ),
          // Give priority to data in errors from 2nd page onwards
          skipErrorOnHasValue: true,
        );
  }
}

class EndItem extends StatelessWidget {
  final VoidCallback onScrollEnd;
  const EndItem({
    super.key,
    required this.onScrollEnd,
  });

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: key ?? const Key('EndItem'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          onScrollEnd();
        }
      },
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
