import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ultra_shine/app/api/api.endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ultra_shine/models/home/films_model.dart';

class FilmServices {
  final _client = http.Client();

  Future<List<FilmsModel>> getFilmsServices() async {
    var url = Uri.parse('$baseUrl/films');
    List<FilmsModel> film = <FilmsModel>[];
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        Iterable types = jsonDecode(response.body)['data'];
        List<FilmsModel> film =
            types.map((e) => FilmsModel.fromJson(e)).toList();
        return film;
      } else {
        return film;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
