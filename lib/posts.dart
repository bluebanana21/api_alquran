import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';
import 'post_detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: posts!
                        .map(
                          (Post post) => GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PostDetail(post: post),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(20.0),
                              width: 200,
                              // height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        child: Text(post.nomor.toString()),
                                      ),
                                      SizedBox(width: 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            post.namaLatin.toString(),
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(children: [
                                            Text(
                                              post.tempatTurun
                                                      .toString()
                                                      .replaceAll(
                                                          RegExp(r'<.*?>'),
                                                          '') +
                                                  " | " +
                                                  post.jumlahAyat.toString() +
                                                  " ayat",
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    post.nama.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  CustomSearchDelegate() {
    print("object");
  }
}
