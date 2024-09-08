import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'paging_data.dart';

class SampleItem extends Equatable implements PagingDataItem {
  @override
  final String id;
  final String name;
  const SampleItem({
    required this.id,
    required this.name,
  });

  SampleItem copyWith({
    String? id,
    String? name,
  }) {
    return SampleItem(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SampleItem.fromMap(Map<String, dynamic> map) {
    return SampleItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SampleItem.fromJson(String source) =>
      SampleItem.fromMap(json.decode(source));

  @override
  String toString() => 'SampleItem(id: $id, name: $name)';

  @override
  List<Object> get props => [id, name];
}
