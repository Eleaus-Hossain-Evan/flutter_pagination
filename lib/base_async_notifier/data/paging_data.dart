import 'package:equatable/equatable.dart';

import 'pagination_meta_data.dart';

abstract class PagingDataItem {
  String get id;
}

/// 汎用ページングWidgetを使うための基底クラス
abstract class PagingData<T extends PagingDataItem> {
  List<T> get items;
  bool get hasMore;
}

class PageBasedPagingData<T extends PagingDataItem>
    with EquatableMixin
    implements PagingData<T> {
  @override
  final List<T> items;
  @override
  final bool hasMore;
  final PaginationMetaData metaData;

  PageBasedPagingData(
      {required this.items, required this.hasMore, required this.metaData});

  PageBasedPagingData<T> copyWith({
    List<T>? items,
    bool? hasMore,
    PaginationMetaData? metaData,
  }) {
    return PageBasedPagingData<T>(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      metaData: metaData ?? this.metaData,
    );
  }

  Map<String, dynamic> toMap(Map<String, dynamic> Function(T) toMap) {
    return {
      'items': items.map(toMap).toList(),
      'hasMore': hasMore,
      'metaData': metaData,
    };
  }

  factory PageBasedPagingData.fromMap(Map<String, dynamic> map,
      T Function(Map<String, dynamic> x) fromItemMap) {
    return PageBasedPagingData<T>(
      items: List<T>.from(map['items']?.map(fromItemMap) ?? const []),
      hasMore: map['hasMore'] ?? false,
      metaData: map['metaData'],
    );
  }

  @override
  String toString() =>
      'PageBasedPagingData(items: $items, hasMore: $hasMore, metaData: $metaData)';

  @override
  List<Object> get props => [items, hasMore, metaData];
}
