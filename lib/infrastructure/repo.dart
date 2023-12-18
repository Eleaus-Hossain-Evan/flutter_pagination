import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app/domain/domain.dart';
import 'package:flutter_app/network_util/network_handler.dart';
import 'package:http/http.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../domain/pagination_request.dart';
import '../domain/pagination_response.dart';
import '../domain/product.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://dummyjson.com/',
  ),
)..interceptors.add(TalkerDioLogger(
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
      printResponseMessage: true,
    ),
  ));

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

  FutureOr<PaginationResponse<Product>> fetchProductDio(
      PaginationRequest? query) async {
    final res = await dio.get<Map>("products", queryParameters: query?.toMap());

    return PaginationResponse<Product>.fromJson(
        res.data!.cast(), (v) => Product.fromMap(v! as Map<String, dynamic>));
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
