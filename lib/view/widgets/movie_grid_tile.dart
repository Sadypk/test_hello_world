import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hello_world/models/movie.dart';
import 'package:test_hello_world/resources/app_colors.dart';
import 'package:test_hello_world/resources/app_text_styles.dart';

class MovieGridTile extends StatelessWidget {
  final Movie movie;
  const MovieGridTile({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey,
        image: DecorationImage(
          image: NetworkImage(
            movie.imageUrl(),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: AppColors.outlineColor.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        movie.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.descriptionText.copyWith(color: AppColors.white,),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: AppColors.white,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
