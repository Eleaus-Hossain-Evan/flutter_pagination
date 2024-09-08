import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaginationMetaData extends Equatable {
  final int totalData;
  final int page;
  final int limit;
  final int totalPage;
  const PaginationMetaData({
    required this.totalData,
    required this.page,
    required this.limit,
    required this.totalPage,
  });

  factory PaginationMetaData.init() =>
      const PaginationMetaData(totalData: 0, page: 0, limit: 0, totalPage: 0);

  PaginationMetaData copyWith({
    int? totalData,
    int? page,
    int? limit,
    int? totalPage,
  }) {
    return PaginationMetaData(
      totalData: totalData ?? this.totalData,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalData': totalData,
      'page': page,
      'limit': limit,
      'totalPage': totalPage,
    };
  }

  factory PaginationMetaData.fromMap(Map<String, dynamic> map) {
    return PaginationMetaData(
      totalData: map['totalData']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
      totalPage: map['totalPage']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationMetaData.fromJson(String source) =>
      PaginationMetaData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaginationMetaData(totalData: $totalData, page: $page, limit: $limit, totalPage: $totalPage)';
  }

  @override
  List<Object> get props => [totalData, page, limit, totalPage];
}
