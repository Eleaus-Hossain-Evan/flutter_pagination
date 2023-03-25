import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class ListState extends Equatable {
  final IList<int> list;
  final bool loading;

  const ListState({
    required this.list,
    required this.loading,
  });

  factory ListState.init() => const ListState(
        list: IListConst([]),
        loading: false,
      );

  ListState copyWith({
    IList<int>? list,
    bool? loading,
  }) {
    return ListState(
      list: list ?? this.list,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [list, loading];

  @override
  String toString() => 'ListState(list: $list, loading: $loading)';
}
