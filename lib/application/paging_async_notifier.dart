import 'package:flutter_app/async_value_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/paging_data.dart';

abstract class PagingAsyncNotifier<T extends PagingData>
    extends AutoDisposeAsyncNotifier<T> {
  Future<void> loadNext();

  //Discard the state and reload it
  void forceRefresh() {
    state = AsyncLoading<T>();
    ref.invalidateSelf();
  }
}

/// Notifier to implement PageBasedPaging
/// By overriding [build] and [fetchNext], loading and errors are handled automatically
abstract class  PageBasedPagingAsyncNotifier<T extends PagingDataItem>
    extends PagingAsyncNotifier<PageBasedPagingData<T>> {
  /// Method to retrieve data from the second page onwards
  /// Assumed to be called only from within a class that inherits [PageBasedPagingAsyncNotifier] (more specifically, from [loadNext])
  Future<PageBasedPagingData<T>> fetchNext(int page);

  /// Get data from 2nd page onwards
  /// Basically there is no need to override
  @override
  Future<void> loadNext() async {
    // Do nothing if there is no data
    final value = state.valueOrNull;
    if (value == null) {
      return;
    }
    // Do nothing if there is an error
    if (state.hasError) {
      return;
    }

    if (value.hasMore) {
      state = AsyncLoading<PageBasedPagingData<T>>().copyWithPrevious(state);

      state = await state.guardPlus(
        () async {
          final next = await fetchNext(value.page + 1);

          return value.copyWith(
            items: [...value.items, ...next.items],
            page: value.page + 1,
            hasMore: next.hasMore,
          );
        },
      );
    }
  }
}
