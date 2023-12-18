import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/detail_screen.dart';
import 'package:flutter_app/application/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Generator")),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(productListProvider(1).future),
        child: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              const pageSize = 10;

              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;
              final productList = ref.watch(
                productListProvider(page),
              );

              return productList.when(
                data: (data) {
                  if (indexInPage >= data.products.length) return null;

                  final product = data.products[indexInPage];
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(id: product.id),
                        )),
                    leading: Image.network(product.thumbnail),
                    title: Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    trailing: Text("\$${product.price}"),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const ProductShimmer(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        isThreeLine: true,
        leading: Container(
          color: Colors.white,
          width: 80,
          height: 80,
        ),
        title: Container(
          color: Colors.white,
          width: 200,
          height: 30,
          margin: const EdgeInsets.only(bottom: 10),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: 200,
              height: 14,
              margin: const EdgeInsets.only(bottom: 6),
            ),
            Container(
              color: Colors.white,
              width: 100,
              height: 14,
            ),
          ],
        ),
        trailing: Container(
          color: Colors.white,
          width: 20,
          height: 30,
        ),
      ),
    );
  }
}
