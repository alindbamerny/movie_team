import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmlpars/movies.dart';

import '../detailscreen.dart';

class GridScreen extends StatefulWidget {
  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  //get movies from assets folder
  Future<List<Movies>> getBooks() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/movies.json");
    List m = jsonDecode(data);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 46, 43, 43),
      child: FutureBuilder<List<Movies>>(
        future: getBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movies>? movie = snapshot.data;
            return GridView.builder(
              itemCount: movie!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
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
                        height: 180,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(movie[index].images![1]),
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(8),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              movie[index].title!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
