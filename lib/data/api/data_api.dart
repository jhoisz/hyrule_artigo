import 'package:dio/dio.dart';

import '../../domain/models/entry.dart';

class DataApi {
  final Dio dio = Dio();

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get('https://botw-compendium.herokuapp.com/api/v3/compendium/category/$category');

    return List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
  } 
}