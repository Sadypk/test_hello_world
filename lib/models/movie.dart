import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:test_hello_world/app_config.dart';
import 'package:test_hello_world/models/genres.dart';
part 'movie.g.dart';

@HiveType(typeId: 0)
@CopyWith()
class Movie {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  List<int>? genreIds;
  @HiveField(3)
  String? id;
  @HiveField(4)
  String? originalLanguage;
  @HiveField(5)
  String? originalTitle;
  @HiveField(6)
  String? overview;
  @HiveField(7)
  double? popularity;
  @HiveField(8)
  String? posterPath;
  @HiveField(9)
  DateTime? releaseDate;
  @HiveField(10)
  String? title;
  @HiveField(11)
  bool? video;
  @HiveField(12)
  double? voteAverage;
  @HiveField(13)
  int? voteCount;
  @HiveField(14)
  bool? isLiked;
  @HiveField(15)
  bool? isSaved;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.isLiked = false,
    this.isSaved = false,
  });

  String imageUrl(){
    if(posterPath == null || posterPath == ''){
      return '';
    }
    return AppConfig().baseImageApiUrl+posterPath!;
  }

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"].toString(),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        isLiked: json["isLiked"] ?? false,
        isSaved: json["isSaved"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<int>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "isLiked" : isLiked,
        "isSaved" : isSaved,
      };

  List<Genre> genreList = <Genre>[
    Genre(
        id: 28,
        name: 'Action'
    ),
    Genre(
        id: 12,
        name: 'Adventure'
    ),
    Genre(
        id: 16,
        name: 'Animation'
    ),
    Genre(
        id: 35,
        name: 'Comedy'
    ),
    Genre(
        id: 80,
        name: 'Crime'
    ),
    Genre(
        id: 99,
        name: 'Documentary'
    ),
    Genre(
        id: 18,
        name: 'Drama'
    ),
    Genre(
        id: 10751,
        name: 'Family'
    ),
    Genre(
        id: 14,
        name: 'Fantasy'
    ),
    Genre(
        id: 36,
        name: 'History'
    ),
    Genre(
        id: 27,
        name: 'Horror'
    ),
    Genre(
        id: 10402,
        name: 'Music'
    ),
    Genre(
        id: 9648,
        name: 'Mystery'
    ),
    Genre(
        id: 10749,
        name: 'Romance'
    ),
    Genre(
        id: 878,
        name: 'Science Fiction'
    ),
    Genre(
        id: 10770,
        name: 'TV Movie'
    ),
    Genre(
        id: 53,
        name: 'Thriller'
    ),
    Genre(
        id: 10752,
        name: 'War'
    ),
    Genre(
        id: 37,
        name: 'Western'
    )
  ];

  List<String> getGenres(){
    List<String> genres = <String>[];
    for(int id in genreIds!){
      int index = genreList.indexWhere((Genre genre) => genre.id == id);
      genres.add(genreList[index].name);
    }
    return genres;
  }
}
