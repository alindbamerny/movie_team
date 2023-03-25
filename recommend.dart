import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmlpars/movies.dart';

import '../detailscreen.dart';

class RecommendList extends StatelessWidget {
  List<Movies>? movies;

  RecommendList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies!.length,
      padding: EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() {
            Get.to(() => DetailScreen(movie: movies![index], allMovies: movies),
                transition: Transition.zoom, duration: Duration(seconds: 1));
          }),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(movies![index].images![1]),
                      fit: BoxFit.cover),
                ),
                child: Align(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      movies![index].title!,
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
  }
}
