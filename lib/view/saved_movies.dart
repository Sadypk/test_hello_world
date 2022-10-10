import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/controllers/movie_controller.dart';
import 'package:test_hello_world/models/movie.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/string_resources.dart';
import 'package:test_hello_world/view/widgets/movie_grid_tile.dart';

class SavedMovies extends StatelessWidget {
  const SavedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResources.savedMovies,
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: movieController.savedMovies.map<Widget>((Movie movie) => MovieGridTile(movie: movie,)).toList(),
        ),
      ),
    );
  }
}
