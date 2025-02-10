import 'dart:convert';
import 'package:api_alquran/surah_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'post_model.dart';

class HttpService {
  final String postsURL = 'https://quran-api.santrikoding.com/api/surah';

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve surah.";
    }
  }

  Future<List<Surah>> getSurah(id) async {
    final String surahURL = 'https://quran-api.santrikoding.com/api/surah/$id';
    Stopwatch stopwatch = Stopwatch()..start();
    Response res = await get(Uri.parse(surahURL));

    stopwatch.stop();
    print("API response time: ${stopwatch.elapsedMilliseconds} ms");

    if (res.statusCode == 200) {
      return compute(parseSurah, res.body);
    } else {
      throw "Unable to retrieve surah detail";
    }
  }

  List<Surah> parseSurah(String responseBody) {
    Map<String, dynamic> body = jsonDecode(responseBody);
    Surah surah = Surah.fromJson(body);
    return [surah]; // Return as a list
  }
}
