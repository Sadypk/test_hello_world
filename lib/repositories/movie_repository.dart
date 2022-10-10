import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_hello_world/app_config.dart';
import 'package:test_hello_world/models/movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_hello_world/resources/enums.dart';

class MovieRepository{
  final Dio dio = Dio();
  final Logger logger = Logger();
  final AppConfig config = AppConfig();

  final CollectionReference _collection = FirebaseFirestore.instance.collection(FirebaseCollections.movies.name);

  Future<String?> addMovie(Movie movie) async{
    try{
      final docRef = await _collection.add(movie.toJson());

      await docRef.update({
        'id' : docRef.id
      });

      return null;
    }on FirebaseException catch (err){
      return err.message;
    }catch(err){
      return err.toString();
    }
  }

  Future<List<Movie>> getMovies(String path, {Map<String, dynamic>? addedQuery})async{
    List<Movie> list = <Movie>[];
    try{
      QuerySnapshot querySnapshot = await _collection.get();

      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      for(var json in allData){
        list.add(Movie.fromJson(json as Map<String, dynamic>));
      }
    } on DioError catch(e){
      logger.e(e);
    }
    return list;
  }

  Future updateMovie(Movie movie) async{
    try{
      await _collection.doc(movie.id).update(movie.toJson());
      return null;
    }on FirebaseException catch (err){
      return err.message;
    }catch(err){
      return err.toString();
    }
  }
}