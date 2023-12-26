// ignore: unused_import, directives_ordering
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_data.freezed.dart';

/// Base class of PagingData item
/// Force to have [id]
abstract class PagingDataItem {
  String get id;
}

/// Base class for using general purpose paging widget
abstract class PagingData<T extends PagingDataItem> {
  List<T> get items;
  bool get hasMore;
}

@freezed
class PageBasedPagingData<T extends PagingDataItem>
    with _$PageBasedPagingData<T>
    implements PagingData<T> {
  const PageBasedPagingData._();
  const factory PageBasedPagingData({
    required List<T> items,
    required int page,
    required bool hasMore,
  }) = _PageBasedPagingData<T>;
}
