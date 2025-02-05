import 'package:api_alquran/http_service.dart';
import 'package:flutter/material.dart';
import 'package:api_alquran/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  late String surahURL = 'https://quran-api.santrikoding.com/api/surah ${post.nomor.toString()}';

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("deatil page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: CircleAvatar(
                  child: Text(post.nomor.toString()),
                ),
              ),
              ListTile(
                title: Text("title"),
                subtitle: Text(
                  post.nama.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                title: Text("body"),
                subtitle: Text(
                  post.deskripsi.toString(),
                ),
              ),
              ListView(
                children: [
                  post.
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
