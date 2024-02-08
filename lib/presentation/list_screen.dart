import 'package:flutter/material.dart';
import 'package:flutter_app/application/provider.dart';
import 'package:flutter_app/presentation/detail_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_infinite_scroll_pagination/riverpod_infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Generator")),
      body: PaginatedListView(
        state: ref.watch(trendingMoviesListProvider),
        itemBuilder: (context, product) => ListTile(
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
        ),
        notifier: ref.read(trendingMoviesListProvider.notifier),
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
