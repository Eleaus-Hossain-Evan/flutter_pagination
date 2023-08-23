// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListHash() => r'724a19c0863afe6ed23c69146efd7611a5cb8a57';

/// See also [ProductList].
@ProviderFor(ProductList)
final productListProvider =
    AutoDisposeAsyncNotifierProvider<ProductList, ProductResponse>.internal(
  ProductList.new,
  name: r'productListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductList = AutoDisposeAsyncNotifier<ProductResponse>;
String _$fetchDataHash() => r'309153eef1a4191e2155873cec3eade4bf9206ca';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FetchData extends BuildlessAutoDisposeAsyncNotifier<Model> {
  late final String parcelId;

  Future<Model> build({
    required String parcelId,
  });
}

/// See also [FetchData].
@ProviderFor(FetchData)
const fetchDataProvider = FetchDataFamily();

/// See also [FetchData].
class FetchDataFamily extends Family<AsyncValue<Model>> {
  /// See also [FetchData].
  const FetchDataFamily();

  /// See also [FetchData].
  FetchDataProvider call({
    required String parcelId,
  }) {
    return FetchDataProvider(
      parcelId: parcelId,
    );
  }

  @override
  FetchDataProvider getProviderOverride(
    covariant FetchDataProvider provider,
  ) {
    return call(
      parcelId: provider.parcelId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchDataProvider';
}

/// See also [FetchData].
class FetchDataProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FetchData, Model> {
  /// See also [FetchData].
  FetchDataProvider({
    required this.parcelId,
  }) : super.internal(
          () => FetchData()..parcelId = parcelId,
          from: fetchDataProvider,
          name: r'fetchDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDataHash,
          dependencies: FetchDataFamily._dependencies,
          allTransitiveDependencies: FetchDataFamily._allTransitiveDependencies,
        );

  final String parcelId;

  @override
  bool operator ==(Object other) {
    return other is FetchDataProvider && other.parcelId == parcelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parcelId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Model> runNotifierBuild(
    covariant FetchData notifier,
  ) {
    return notifier.build(
      parcelId: parcelId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
