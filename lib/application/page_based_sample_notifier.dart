// import 'package:flutter_app/application/paging_async_notifier.dart';
// import 'package:flutter_app/domain/paging_data.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../domain/sample_item.dart';

// final pageBasedSampleNotifierProvider = AsyncNotifierProvider.autoDispose<
//     PageBasedSampleNotifier, PageBasedSampleState>(
//   () => PageBasedSampleNotifier(),
// );

// typedef PageBasedSampleState = PageBasedPagingData<SampleItem>;

// class PageBasedSampleNotifier extends PageBasedPagingAsyncNotifier<SampleItem> {
//   /// １ページ目の取得処理
//   @override
//   Future<PageBasedSampleState> build() async {
//     // final res = await ref.read(sampleRepositoryProvider).getByPage();
//     ref.keepAlive();

//     return PageBasedSampleState(
//       items: res //
//           .items,
//       page: 0,
//       hasMore: res.hasMore,
//     );
//   }

//   /// 2ページ目以降の取得処理
//   /// エラーハンドリングなどはPageBasedPagingAsyncNotifier側でよしなに行われるので、ここでは取得処理のみを記述する
//   @override
//   Future<PageBasedSampleState> fetchNext(int page) async {
//     final res =
//         await ref.read(sampleRepositoryProvider).getByPage(page: page + 1);
//     ref.keepAlive();

//     return PageBasedSampleState(
//       items: res //
//           .items,
//       page: page + 1,
//       hasMore: res.hasMore,
//     );
//   }
// }
