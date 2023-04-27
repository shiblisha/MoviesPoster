import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/Movie api/movie_api.dart';
import '../Repository/ModelClass/MovieModel.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  late List<MovieModel> trendingMovies;
  MovieApi moviesApi=MovieApi();
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovieDetails>((event, emit)async {
      emit(MovieBlocLoading());
      try{

        trendingMovies = await moviesApi.getMovie();
        emit(MovieBlocLoaded());
      } catch(e){
        emit(MovieBlocEror());}
    });
  }
}
