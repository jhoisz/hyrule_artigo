import 'package:dio/dio.dart';

import '../../domain/models/entry.dart';
import '../../utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get(url + category);

    return List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
  } 
}