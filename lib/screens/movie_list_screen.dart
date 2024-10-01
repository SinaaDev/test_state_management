import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task_state_management_2/provider/auth.dart';
import 'package:task_state_management_2/screens/favorite_list.dart';
import 'package:task_state_management_2/screens/sign_in_screen.dart';
import 'package:task_state_management_2/widgets/movie_item.dart';

import '../provider/movie.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movie>(context).movies;
    final favoriteMovies = movies.where((movie) => movie.isFavorite);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(onPressed: (){
            Provider.of<Auth>(context,listen: false).logout();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(24),
            InkWell(
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => FavoriteList(),)),
              child: Container(
                color: Colors.red[100],
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 32,
                    ),
                    Gap(12),
                    Text(
                      'Go To My List (${favoriteMovies.length})',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Gap(24),
            Expanded(
              child: ListView.separated(
                itemCount: movies.length,
                separatorBuilder: (context, index) => SizedBox(height: 12,),
                itemBuilder: (context, i) => MovieItem(movie: movies[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
