import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/pagination_meta_data.dart';
import '../data/paging_data.dart';
import '../data/paging_model.dart';
import '../data/simple_repository.dart';
import 'paging_async_notifier.dart';

final pageBasedSampleNotifierProvider = AsyncNotifierProvider.autoDispose<
    PageBasedSampleNotifier, PageBasedSampleState>(PageBasedSampleNotifier.new);

typedef PageBasedSampleState = PageBasedPagingData<SampleItem>;

class PageBasedSampleNotifier extends PageBasedPagingAsyncNotifier<SampleItem> {
  /// １ページ目の取得処理
  @override
  Future<PageBasedSampleState> build() async {
    Timer? timer;

    final res = await ref.read(sampleRepositoryProvider).getByPage();

    ref.onDispose(() => timer?.cancel());

    ref.onResume(() => timer?.cancel());

    final keepAliveLink = ref.keepAlive();

    ref.onCancel(() => timer = Timer(
          const Duration(seconds: 10),
          () => keepAliveLink.close(),
        ));

    return PageBasedSampleState(
      items: res //
          .items,
      metaData: PaginationMetaData.init(),
      hasMore: res.hasMore,
    );
  }

  @override
  Future<PageBasedSampleState> fetchNext(int page) async {
    final res =
        await ref.read(sampleRepositoryProvider).getByPage(page: page + 1);
    ref.keepAlive();

    return PageBasedSampleState(
      items: res //
          .items,
      metaData: state.requireValue.metaData.copyWith(page: page + 1),
      hasMore: res.hasMore,
    );
  }
}
