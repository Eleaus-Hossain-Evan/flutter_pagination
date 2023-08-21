import 'package:flutter_app/domain.dart';
import 'package:flutter_app/network_util/network_handler.dart';

class Repo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, ModelResponse>> fetchData(String id) {
    return api.get(
        endPoint: "api/v1/parcel/fetch-single/$id",
        fromData: (data) => ModelResponse.fromMap(data),
        withToken: true);
  }
}
