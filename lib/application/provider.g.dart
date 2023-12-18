// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListHash() => r'b502b79217ad6f6a02971212ba368e71ff2dfdd9';

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

abstract class _$ProductList
    extends BuildlessAutoDisposeAsyncNotifier<ProductResponse> {
  late final int page;

  FutureOr<ProductResponse> build(
    int page,
  );
}

/// See also [ProductList].
@ProviderFor(ProductList)
const productListProvider = ProductListFamily();

/// See also [ProductList].
class ProductListFamily extends Family<AsyncValue<ProductResponse>> {
  /// See also [ProductList].
  const ProductListFamily();

  /// See also [ProductList].
  ProductListProvider call(
    int page,
  ) {
    return ProductListProvider(
      page,
    );
  }

  @override
  ProductListProvider getProviderOverride(
    covariant ProductListProvider provider,
  ) {
    return call(
      provider.page,
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
  String? get name => r'productListProvider';
}

/// See also [ProductList].
class ProductListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductList, ProductResponse> {
  /// See also [ProductList].
  ProductListProvider(
    this.page,
  ) : super.internal(
          () => ProductList()..page = page,
          from: productListProvider,
          name: r'productListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productListHash,
          dependencies: ProductListFamily._dependencies,
          allTransitiveDependencies:
              ProductListFamily._allTransitiveDependencies,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is ProductListProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ProductResponse> runNotifierBuild(
    covariant ProductList notifier,
  ) {
    return notifier.build(
      page,
    );
  }
}

String _$productDetailHash() => r'428c3da8b3583aabd6a42f6fb511391c01c17da3';

abstract class _$ProductDetail
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final int id;

  FutureOr<Product> build(
    int id,
  );
}

/// See also [ProductDetail].
@ProviderFor(ProductDetail)
const productDetailProvider = ProductDetailFamily();

/// See also [ProductDetail].
class ProductDetailFamily extends Family<AsyncValue<Product>> {
  /// See also [ProductDetail].
  const ProductDetailFamily();

  /// See also [ProductDetail].
  ProductDetailProvider call(
    int id,
  ) {
    return ProductDetailProvider(
      id,
    );
  }

  @override
  ProductDetailProvider getProviderOverride(
    covariant ProductDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'productDetailProvider';
}

/// See also [ProductDetail].
class ProductDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductDetail, Product> {
  /// See also [ProductDetail].
  ProductDetailProvider(
    this.id,
  ) : super.internal(
          () => ProductDetail()..id = id,
          from: productDetailProvider,
          name: r'productDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productDetailHash,
          dependencies: ProductDetailFamily._dependencies,
          allTransitiveDependencies:
              ProductDetailFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Product> runNotifierBuild(
    covariant ProductDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}

String _$fetchDataHash() => r'309153eef1a4191e2155873cec3eade4bf9206ca';

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
