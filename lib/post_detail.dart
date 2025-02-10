import 'package:api_alquran/http_service.dart';
import 'package:api_alquran/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:api_alquran/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("detail page"),
        actions: [
          IconButton(
              onPressed: () {
                goToNextSurah();
              },
              icon: Icon(Icons.arrow_forward_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    post.tempatTurun.toString(),
                  ),
                  Text(
                    "${post.nomor}${post.namaLatin}",
                  ),
                  Text(
                    "${post.jumlahAyat} ayat",
                  ),
                ],
              ),
              ListTile(
                title: const Text("title"),
                subtitle: Text(
                  post.nama.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                title: const Text("body"),
                subtitle: Text(
                  post.deskripsi.toString().replaceAll(RegExp(r'<.*?>'), ''),
                ),
              ),
              FutureBuilder(
                future: httpService.getSurah(post.nomor),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surahs = snapshot.data;
                    return SizedBox(
                      height: 500,
                      child: ListView(
                        children: surahs!
                            .map(
                              (Surah surah) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: surah.ayat!.map(
                                            (Ayat ayat) {
                                              return Card(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                elevation: 3,
                                                child: ListTile(
                                                  title: Column(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          ayat.ar.toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          ayat.tr
                                                              .toString()
                                                              .replaceAll(
                                                                  RegExp(
                                                                      r'<.*?>'),
                                                                  ''),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          ayat.idn.toString(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToNextSurah() {
    print("object");
  }
}
