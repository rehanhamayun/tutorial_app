import 'package:dartapp/configs/appbar.dart';
import 'package:dartapp/configs/configs.dart';
import 'package:dartapp/configs/drawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(
        header: Text(
          "Dart Basics",
          style: headingMain,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text("Rehan Hamayunn"),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
