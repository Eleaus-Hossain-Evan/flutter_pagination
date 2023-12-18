import 'package:json_annotation/json_annotation.dart';

import 'pagination_request.dart';

part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  final List<T> products;
  final int total;
  final int skip;
  final int limit;

  const PaginationResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginationResponseFromJson(json, fromJsonT);

  toJson(PaginationResponse<T> model, Object? Function(T value) toJsonT) =>
      _$PaginationResponseToJson<T>(model, toJsonT);

  bool get isCompleted => skip >= total;

  PaginationRequest nextPage() =>
      PaginationRequest(limit: limit, skip: skip + limit);
}
