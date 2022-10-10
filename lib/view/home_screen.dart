import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/controllers/movie_controller.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';
import 'package:test_hello_world/resources/string_resources.dart';
import 'package:test_hello_world/view/choose_your_interests_screen.dart';
import 'package:test_hello_world/view/saved_movies.dart';
import 'package:test_hello_world/view/timeline_page.dart';
import 'package:test_hello_world/view/widgets/movie_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.grey,
        ),
        title: Text(
          StringResources.goodMorning,
          style: AppTextStyles.hintText,
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Get.to(const ChooseYourInterest());
                },
                child: Text(StringResources.chooseInterests, style: AppTextStyles.movieDetailsHeader,),),
              Divider(height: 20, thickness: 1, color: AppColors.grey,),
              GestureDetector(
                onTap: (){
                  Get.to(const SavedMovies());
                },
                child: Text(StringResources.savedMovies, style: AppTextStyles.movieDetailsHeader,),),
              Divider(height: 20, thickness: 1, color: AppColors.grey,),
              GestureDetector(
                onTap: (){
                  Get.to(const TimelinePage());
                },
                child: Text(StringResources.timeLine, style: AppTextStyles.movieDetailsHeader,),),
              Divider(height: 20, thickness: 1, color: AppColors.grey,),

            ],
          ),
        ),
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: movieController.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieListItem(
                  movie: movieController.movies[index],
                  isSaved: movieController.savedMovies.contains(movieController.movies[index]),
                );
              },
            ),
          )),
    );
  }
}
