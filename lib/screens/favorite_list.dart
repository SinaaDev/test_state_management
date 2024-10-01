import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_state_management_2/models/movie.dart';
import 'package:task_state_management_2/provider/movie.dart';
import 'package:task_state_management_2/widgets/favorite_item.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movie>(context).movies;
    final favoriteMovies = movies.where((movie) => movie.isFavorite).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12),
        child: ListView.separated(
          itemCount: favoriteMovies.length,
          separatorBuilder: (context, index) => SizedBox(height: 12,),
          itemBuilder: (context, i) => FavoriteItem(movie: favoriteMovies[i]),
        ),
      ),
    );
  }
}
