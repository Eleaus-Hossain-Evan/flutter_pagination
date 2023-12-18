import 'package:flutter_app/domain/domain.dart';
import 'package:flutter_app/network_util/network_handler.dart';
import 'package:http/http.dart';

import '../domain/product.dart';

class Repo {
  final api = NetworkHandler.instance;
  final client = Client();

  Future<Either<CleanFailure, ModelResponse>> fetchData(String id) {
    return api.get(
        endPoint: "api/v1/parcel/fetch-single/$id",
        fromData: (data) => ModelResponse.fromMap(data),
        withToken: true);
  }

  Future<Either<CleanFailure, ProductResponse>> fetchProduct(int page) {
    final api2 = NetworkHandler.instance
      ..setup(baseUrl: 'https://dummyjson.com/');

    return api2.get(
        endPoint: "products?limit=10&skip=${page * 10}",
        fromData: (data) => ProductResponse.fromMap(data),
        withToken: false);
  }

  Future<Either<CleanFailure, Product>> fetchProductDetail(int id) {
    final api2 = NetworkHandler.instance
      ..setup(baseUrl: 'https://dummyjson.com/');

    return api2.get(
        endPoint: "products/$id",
        fromData: (data) => Product.fromMap(data),
        withToken: false);
  }
}
