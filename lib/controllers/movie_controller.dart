import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_hello_world/controllers/hive_controller.dart';
import 'package:test_hello_world/models/movie.dart';
import 'package:test_hello_world/repositories/movie_repository.dart';

class MovieController extends GetxController{
  RxList<Movie> movies = <Movie>[].obs;
  RxList<Movie> savedMovies = <Movie>[].obs;
  RxInt currentPage = 1.obs;
  RxBool isFetchingData = false.obs;
  MovieRepository movieRepository = Get.find();
  HiveController hiveController = HiveController();

  @override
  void onInit() {
    manageCacheData();
    super.onInit();
  }

  void manageCacheData() async{
    Box<Movie> box = await hiveController.openBox();
    Box<Movie> savedBox = await hiveController.openSavedMoviesBox();

    List<Movie> cachedList = hiveController.getCachedMovies(box);
    savedMovies.value = hiveController.getCachedMovies(savedBox);
    movies.refresh();
    List<Movie> queriedList = <Movie>[];

    // if cache has data show cache data while api fetches new data
    if(cachedList.isNotEmpty){
      movies.addAll(cachedList);
      queriedList.addAll(await getCurrentPageData(currentPage.value));
      if(queriedList.isNotEmpty){
        movies.clear();
        movies.addAll(queriedList);

        // replace cache data with new data
        hiveController.clearCache(box);
        for (Movie movie in queriedList) {
          hiveController.addMoviesToCache(box, movie);
        }}
    }else{

      // cache is empty, fetch new api data
      queriedList.addAll(await getCurrentPageData(currentPage.value));
      movies.addAll(queriedList);

      // add data to cache
      for (Movie movie in queriedList) {
        hiveController.addMoviesToCache(box, movie);
      }
    }
  }

  onTapFavorite(int index){
    movies[index] = movies[index].copyWith(isLiked: !(movies[index].isLiked)!);
    movieRepository.updateMovie(movies[index]);
  }

  // fetching next page data
  void nextPage()async{
    int nextPage = currentPage.value+1;
    isFetchingData.value = true;
    movies.addAll(await getCurrentPageData(nextPage));
    isFetchingData.value = false;
    currentPage.value++;
  }

  // get data for a specific page
  Future<List<Movie>> getCurrentPageData(int page) async => await movieRepository.getMovies('/movie/popular', addedQuery: {'page': page});

  // Saved movies functions
  Future<void> onTapSaveMovie(Movie movie) async{
    int index = movies.indexWhere((element) => movie == element);
    movies[index] = movies[index].copyWith(isSaved: !(movies[index].isSaved)!);
    movieRepository.updateMovie(movies[index]);
    Box<Movie> savedBox = await hiveController.openSavedMoviesBox();
    if(savedMovies.contains(movie)){
      savedMovies.remove(movie);
    }else {
      savedMovies.add(movie);
    }
    savedBox.clear();
    for (Movie movie in savedMovies) {
      hiveController.addMoviesToCache(savedBox, movie);
    }
  }
}