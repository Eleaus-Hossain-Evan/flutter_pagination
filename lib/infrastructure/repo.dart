import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app/domain/domain.dart';
import 'package:flutter_app/network_util/network_handler.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../domain/product.dart';

part 'repo.g.dart';

@Riverpod(keepAlive: true)
Repo repo(RepoRef ref) {
  return Repo();
}

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

  Future<PaginatedResponse<Model>> fetchDataDio({
    int page = 1,
    String? query,
  }) async {
    dio.options.baseUrl = 'https://api.courier.b2gsoft.xyz/api/v1';
    final result = await dio.post<Map<String, dynamic>>(
        "/parcel/fetch-all-parcel-by-merchant?page=$page&limit=4",
        data: {
          "status": "all_return",
          "value": "",
          "startTime": "",
          "endTime": ""
        },
        options: Options(headers: {
          "Authorization":
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjY0ZjAxMjg0MTdlODY5MjNhNDVlNWMwMSIsIm5hbWUiOiJNZXJjaGFudCBNb2hha2hhbGkiLCJwaG9uZSI6IjAxOTU2OTQ1MjgzIiwiZW1haWwiOiJtb2hha2hhbGlAbWVyY2hhbnQuY29tIiwiaHViSWQiOiI2NGYwMGY2ZTE3ZTg2OTIzYTQ1ZTViYTQiLCJodWJOYW1lIjoiTW9oYWtoYWxpIEh1YiAiLCJyb2xlIjoibWVyY2hhbnQifSwiaWF0IjoxNzA3Mzg0NjU5LCJleHAiOjE3MDc5ODk0NTl9.eRCH_S2Mxd0OLTL_LQH0KV6-nL2zBrFHacxq-vKUftE'
        }));

    return PaginatedResponse.fromJson(
      result.data!,
      dataMapper: Model.fromMap,
      dataField: 'data',
      paginationParser: (data) => Pagination(
        totalNumber: data['metaData']['totalData'] as int,
        currentPage: data['metaData']['page'] as int,
        lastPage: data['metaData']['totalPage'] as int,
      ),
    );
  }

  //;  list screen (dummyjson.com)
  Future<Either<CleanFailure, ProductResponse>> fetchProduct(int page) {
    final api2 = NetworkHandler.instance
      ..setup(baseUrl: 'https://dummyjson.com/');

    return api2.get(
        endPoint: "products?limit=10&skip=${page * 10}",
        fromData: (data) => ProductResponse.fromMap(data),
        withToken: false);
  }

  //;  list screen (dummyjson.com)
  Future<PaginatedResponse<Product>> fetchProductDio({
    int page = 1,
    String? query,
  }) async {
    final result = await dio.get<Map<String, dynamic>>(
        "products?limit=10&skip=${(page - 1) * 10}",
        options: Options(responseType: ResponseType.json));

    return PaginatedResponse.fromJson(
      result.data!,
      dataMapper: Product.fromMap,
      dataField: 'products',
      paginationParser: (data) => Pagination(
        totalNumber: data['total'] as int,
        currentPage:
            ((data['skip'] as int) / (data['limit'] as int)).floor() + 1,
        lastPage: (data['total'] as int) / data['limit'] as int,
      ),
    );
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
