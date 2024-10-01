import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/movie.dart';

class Movie extends ChangeNotifier{
  
  final List<MovieModel> _movies = [
    MovieModel(name: 'Inception', duration: '2h 28m'),
    MovieModel(name: 'Interstellar', duration: '2h 49m'),
    MovieModel(name: 'The Dark Knight', duration: '2h 32m'),
    MovieModel(name: 'The Matrix', duration: '2h 16m'),
    MovieModel(name: 'The Godfather', duration: '2h 55m'),
    MovieModel(name: 'Fight Club', duration: '2h 19m'),
    MovieModel(name: 'Pulp Fiction', duration: '2h 34m'),
    MovieModel(name: 'Forrest Gump', duration: '2h 22m'),
  ];

  List<MovieModel> get movies => UnmodifiableListView(_movies);

  void toggleFavorite(MovieModel movie){
    movie.toggleFavorite();
    notifyListeners();
  }

}