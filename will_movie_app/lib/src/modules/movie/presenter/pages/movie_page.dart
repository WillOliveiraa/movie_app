import 'package:flutter/material.dart';
import 'package:will_design_system/will_design_system.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: DSText('Movie Page')),
    );
  }
}
