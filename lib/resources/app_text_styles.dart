import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_hello_world/resources/app_colors.dart';

class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 24,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle movieHeader = TextStyle(
    fontSize: 18,
    color: AppColors.grey,
  );

  static TextStyle movieDetailsHeader = TextStyle(
    fontSize: 24,
    color: AppColors.grey,
  );

  static TextStyle genreText = TextStyle(
    fontSize: 11,
    color: AppColors.genre,
  );

  static TextStyle descriptionText = TextStyle(
    fontSize: 12,
    color: AppColors.grey,
  );

  static TextStyle descriptionSectionHeaderText = TextStyle(
    fontSize: 12,
    color: AppColors.black.withOpacity(0.8),
    fontWeight: FontWeight.bold,
  );

  static TextStyle hintText = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );
}
