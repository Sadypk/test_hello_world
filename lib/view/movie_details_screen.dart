import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_hello_world/models/movie.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';
import 'package:test_hello_world/resources/string_resources.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            // The movie poster, title, genres & rating
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: MoviePoster(
                  movie: movie, minValue: 300, maxValue: (Get.width / 2) * 3),
            ),

            // Movie release date & overview
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.overview ?? '',
                        style: AppTextStyles.descriptionText.copyWith(color: AppColors.white.withOpacity(0.8)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        StringResources.releaseDate,
                        style: AppTextStyles.descriptionSectionHeaderText.copyWith(color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(movie.releaseDate ?? DateTime.now()),
                        style: AppTextStyles.descriptionText.copyWith(
                            color: Colors.orangeAccent.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        height: 300,
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class MoviePoster extends SliverPersistentHeaderDelegate {
  final Movie movie;
  final double maxValue;
  final double minValue;

  MoviePoster({
    required this.movie,
    required this.maxValue,
    required this.minValue,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        children: <Widget>[
          Blur(
            blur: 3,
            blurColor: AppColors.black,
            child: CachedNetworkImage(
              imageUrl: movie.imageUrl(),
              imageBuilder:
                  (BuildContext context, ImageProvider imageProvider) =>
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: movie.id.toString,
              child: CachedNetworkImage(
                imageUrl: movie.imageUrl(),
                imageBuilder:
                    (BuildContext context, ImageProvider imageProvider) =>
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
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
                    height: Get.height,
                    width: (Get.height / 3) * 2,
                    decoration: BoxDecoration(color: AppColors.grey),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black,
                    ],
                    stops: const <double>[
                      0.0,
                      0.99
                    ])),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title ?? '',
                          style: AppTextStyles.movieDetailsHeader.copyWith(color: AppColors.white.withOpacity(0.8)),
                          maxLines: 2,
                        ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: '${movie.voteAverage}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.white),
                                  ),
                                  TextSpan(
                                    text: '/10',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color:
                                        AppColors.white.withOpacity(0.6)),
                                  ),
                                ]),
                              ),
                              Text(
                                '${(movie.voteCount! / 1000).toStringAsFixed(1)}K',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: AppColors.white.withOpacity(0.6),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 25,
                    child: ListView.builder(
                      itemCount: movie.getGenres().length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => Row(
                        children: <Widget>[
                          Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.grey,
                            ),
                            child: Center(
                              child: Text(
                                movie.getGenres()[index],
                                style: AppTextStyles.descriptionText.copyWith(
                                    color: AppColors.blueLight),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxValue;

  @override
  // TODO: implement minExtent
  double get minExtent => minValue;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
