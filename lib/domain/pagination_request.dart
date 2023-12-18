import 'package:json_annotation/json_annotation.dart';

part 'pagination_request.g.dart';

@JsonSerializable()
class PaginationRequest {
  final int limit;
  final int skip;
  const PaginationRequest({
    required this.limit,
    required this.skip,
  });

  PaginationRequest copyWith({
    int? limit,
    int? skip,
  }) {
    return PaginationRequest(
      limit: limit ?? this.limit,
      skip: skip ?? this.skip,
    );
  }

  factory PaginationRequest.fromMap(Map<String, dynamic> map) =>
      _$PaginationRequestFromJson(map);

  Map<String, dynamic> toMap() => _$PaginationRequestToJson(this);
}
