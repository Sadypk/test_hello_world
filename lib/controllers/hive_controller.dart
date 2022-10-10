import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_hello_world/models/movie.dart';


// used for caching data
class HiveController{
  String boxName = 'movie_box';
  String savedMoviesBox = 'saved_movie_box';

  // opens box
  Future<Box<Movie>> openBox() async{
    Box<Movie> box = await Hive.openBox(boxName);
    return box;
  }

  Future<Box<Movie>> openSavedMoviesBox() async{
    Box<Movie> box = await Hive.openBox(savedMoviesBox);
    return box;
  }


  // fetches box data
  List<Movie> getCachedMovies(Box<Movie> box){
    return box.values.toList();
  }


  // adds data to box
  Future<void> addMoviesToCache(Box<Movie> box, Movie movie)async{
    await box.put(movie.id, movie);
  }


  // clears box data
  Future<void> clearCache(Box<Movie> box)async{
    await box.clear();
  }
}