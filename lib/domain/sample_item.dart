// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:flutter_app/domain/paging_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_item.freezed.dart';

/// PagingDataItemを実装したクラス
@freezed
class SampleItem with _$SampleItem implements PagingDataItem {
  const factory SampleItem({
    required String id,
    required String name,
  }) = _SampleItem;
}