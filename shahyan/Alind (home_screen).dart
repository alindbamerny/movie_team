import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xmlpars/widget/GridScreen.dart';
import 'package:xmlpars/widget/ListScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: SizedBox(
            width: 200,
            height: 50,
            child: Lottie.asset(
              "assets/data/logo.json",
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isGrid = !_isGrid;
                });
              },
              icon: Icon(
                _isGrid ? Icons.list : Icons.grid_view,
                color: Colors.white,
              ))
        ],
      ),
      body: _isGrid ? GridScreen() : ListScreen(),
    );
  }
}
