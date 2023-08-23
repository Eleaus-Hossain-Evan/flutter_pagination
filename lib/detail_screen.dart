import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_app/provider.dart';

class DetailScreen extends HookConsumerWidget {
  static const route = '/detail';

  const DetailScreen({
    super.key,
    required this.id,
  });

  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productDetailProvider(id));
    // useEffect(() {
    //   Future.microtask(() => ref.read(productDetailProvider(id).future));
    //   return null;
    // }, const []);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: state.when(
          data: (data) => RefreshIndicator.adaptive(
            onRefresh: () => ref.refresh(productDetailProvider(id).future),
            child: ListView(
              children: [
                Image.network(
                  data.thumbnail,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          data.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "\$${data.price}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data.images
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Card(
                                  elevation: 6,
                                  child: Image.network(
                                    e,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const DetailShimmer(),
        ));
  }
}

class DetailShimmer extends StatelessWidget {
  const DetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white,
                  height: 120,
                  width: 120,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 50,
                        width: 180,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        height: 50,
                        width: 180,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              height: 60,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              height: 60,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  height: 50,
                  width: w / 2 - 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  color: Colors.white,
                  height: 50,
                  width: w / 2 - 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
