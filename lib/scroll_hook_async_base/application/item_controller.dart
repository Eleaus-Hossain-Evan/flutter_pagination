import 'dart:async';

import 'package:flutter_app/scroll_hook_async_base/data/repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../data/pagination_request.dart';
import '../data/pagination_response.dart';
import '../data/product.dart';
import 'pagination_controller.dart';

final itemsController = AsyncNotifierProvider.autoDispose<ItemsController,
    PaginationResponse<Product>>(ItemsController.new);

class ItemsController
    extends AutoDisposeAsyncNotifier<PaginationResponse<Product>>
    with PaginationController<Product> {
  @override
  Future<PaginationResponse<Product>> build() async {
    return await loadData(const PaginationRequest(skip: 0, limit: 20));
  }

  @override
  FutureOr<PaginationResponse<Product>> loadData(PaginationRequest? query) {
    return Repo().fetchProductDio(query);
  }
}
