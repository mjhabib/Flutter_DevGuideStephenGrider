import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: const Text('Show some texts here'),
      // body: buildList(),
    );
  }

  // in this example, if we have 1000 items to fetch, our ListView.builder is gonna show only as many items as it can (7 items) on screen after the Future resolvers (2 sec). If we scroll down, it'll fetch more. This is a useful feature because our app is not gonna have a bad performance and wait to fetch all 1000 items at once.

  // Widget buildList() {
  //   return ListView.builder(
  //       itemCount: 1000,
  //       itemBuilder: (context, int index) {
  //         return FutureBuilder(
  //             future: getFuture(),
  //             builder: (context, snapshot) {
  //               return SizedBox(
  //                 height: 80,
  //                 child: snapshot.hasData
  //                     ? Text('I am visible $index')
  //                     : Text('No data yet $index'),
  //               );
  //             });
  //       });
  // }

  // getFuture() {
  //   return Future.delayed(const Duration(seconds: 2), () => 'hi');
  // }
}
