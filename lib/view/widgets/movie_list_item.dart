import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_hello_world/controllers/movie_controller.dart';
import 'package:test_hello_world/models/movie.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';
import 'package:test_hello_world/view/movie_details_screen.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final bool isSaved;

  const MovieListItem({
    Key? key,
    required this.movie,
    required this.isSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    return GestureDetector(
      onTap: ()=> Get.to(MovieDetailsScreen(movie: movie)),
      child: Container(
        height: 210,
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: <Widget>[
            // Movie Poster
            Container(
              height: 210,
              width: 130,
              color: movie.posterPath != null ? null : AppColors.grey,
              child: movie.posterPath != null
                  ? Hero(
                      tag: movie.id.toString,
                      child: CachedNetworkImage(
                        imageUrl: movie.imageUrl(),
                        imageBuilder:
                            (BuildContext context, ImageProvider imageProvider) =>
                                Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 200,
                            width: 130,
                            decoration: BoxDecoration(color: AppColors.grey),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(color: AppColors.grey),
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),

            // Movie overview, ratings, genres
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title ?? '',
                    style: AppTextStyles.movieHeader,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    movie.getGenres().join(', '),
                    style: AppTextStyles.genreText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.starYellow,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '${movie.voteAverage}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.grey,
                              ),
                            ),
                            TextSpan(
                              text: '/10',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: AppColors.grey.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          int index = movieController.movies.indexWhere((Movie movieValue) => movie == movieValue);
                          movieController.onTapFavorite(index);
                        },
                        child: Icon(
                          movie.isLiked!? Icons.favorite_rounded : Icons.favorite_border,
                          size: 18,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            movieController.onTapSaveMovie(movie);
                          },
                          child: Icon(
                            movie.isSaved!? Icons.bookmark : Icons.bookmark_border,
                            size: 18,
                            color: AppColors.darkGrey,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Text(
                      movie.overview ?? '',
                      style: AppTextStyles.descriptionText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 9,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerMovieListItem extends StatelessWidget {
  const ShimmerMovieListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width: 130,
            color: AppColors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 18,
                  width: 80,
                  color: AppColors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 11,
                  width: 80,
                  color: AppColors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.starYellow,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 10,
                      width: 80,
                      color: AppColors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
