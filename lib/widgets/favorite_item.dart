import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:task_state_management_2/models/movie.dart';
import 'package:task_state_management_2/provider/movie.dart';

class FavoriteItem extends StatelessWidget {
  final MovieModel movie;
  const FavoriteItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 90,
      child: Row(children: [
        Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(movie.name,style: TextStyle(color: Colors.white,fontSize: 24),),
            Text(movie.duration,style: TextStyle(color: Colors.white)),
          ],),
        Spacer(),
        TextButton(onPressed: (){
          Provider.of<Movie>(context,listen: false).toggleFavorite(movie);
        }, child: Icon(Icons.delete,color: Colors.red,))
      ],),
    );
  }
}
