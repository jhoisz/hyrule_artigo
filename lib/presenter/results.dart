import 'package:flutter/material.dart';

import '../controllers/api_controller.dart';
import '../utils/consts/categories_images.dart';
import 'components/entry_card.dart';

class Results extends StatelessWidget {
  Results({super.key, required this.category});
  final String category;
  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[category]!),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: apiController.getEntriesByCategory(category: category),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData && snapshot.data != null) {
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return EntryCard(
                              entry: snapshot.data![index],
                            );
                          },
                          childCount: snapshot.data!.length,
                        ),
                      ),
                    ],
                  );
                }
                break;
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
