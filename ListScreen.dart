import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xmlpars/detailscreen.dart';
import 'package:xmlpars/movies.dart';
import 'package:get/get.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //load movies from local json file in assets
  Future<List<Movies>> getBooks() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/movies.json");
    List m = jsonDecode(data);

    //parse json to dart class
    List<Movies> jsonResult = m
        .map(
          (value) => Movies.fromJson(value),
        )
        .toList();
    return jsonResult;
  }

  @override
  void initState() {
    getBooks();
    super.initState();
  }

  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 43, 43),
      body: FutureBuilder<List<Movies>>(
        future: getBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movies>? movie = snapshot.data;
            return ListView.builder(
              itemCount: movie!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (() {
                    Get.to(
                        () =>
                            DetailScreen(movie: movie[index], allMovies: movie),
                        transition: Transition.zoom,
                        duration: Duration(seconds: 1));
                  }),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(movie[index].images![1]),
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          // ignore: sort_child_properties_last
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(8),
                            color: Colors.black.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  movie[index].title!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(
                                  Icons.play_circle_fill_rounded,
                                  color: Colors.red[700],
                                  size: 50,
                                )
                              ],
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie[index].plot!,
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Released: " + movie[index].released!,
                              style: TextStyle(color: Colors.blue),
                            ),
                            Text(
                              "Gener: " + movie[index].genre!,
                              style: TextStyle(color: Colors.red[700]),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
