import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(listProvider);
    final scrollController = useScrollController();

    final currentPage = useState(0);

    scrollListener() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      // double delta = MediaQuery.of(context).size.height * 0.10;

      if (maxScroll == currentScroll) {
        //
        //one more condition here to determine for load more ro not (is this the last page or not)
        //
        log("Get more data");
        currentPage.value++;
        ref.read(listProvider.notifier).loadData(currentPage.value);
      }
    }

    ref.listen(listProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });

    useEffect(() {
      scrollController.addListener(scrollListener);
      return () {
        scrollController.removeListener(scrollListener);
        scrollController.dispose();
      };
    }, []);

    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          final item = state.list[index];

          // final page = index ~/ 10;
          // final itemIndex = index % 10;
          // ref.watch(listProvider.notifier).loadData(page);
          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: ListTile(title: Text('$item')),
          );
        },
        itemCount: state.list.length,
      ),
    );
  }
}
