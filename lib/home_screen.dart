
import 'package:flutter/material.dart';
import 'package:untitled/course_grid.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseGrid(),
    );
  }
}


