import 'package:flutter/material.dart';
import 'package:flutter_app/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends HookConsumerWidget {
  static const route = '/detail';

  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchDataProvider(parcelId: "JWCNP85BUDW2NDA7"));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: state.when(
          data: (data) => RefreshIndicator.adaptive(
            onRefresh: () => ref.refresh(
                fetchDataProvider(parcelId: "JWCNP85BUDW2NDA7").future),
            child: ListView(
              children: [
                Text('Name: ${data.customerInfo.name}'),
                Text('Phone:  ${data.customerInfo.phone}'),
                Text('Address: ${data.customerInfo.address} '),
                Text('Status: ${data.regularStatus} '),
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
