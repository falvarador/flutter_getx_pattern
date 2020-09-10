import 'package:flutter/material.dart';
import 'package:getx_pattern_demo/app/data/models/movie.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key key, @required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading:
            Image.network("${Constant.MOVIE_DB_IMAGE_PATH}${movie.posterPath}"),
        title: Text(movie.title),
        subtitle: Text(movie.overview),
      ),
    );
  }
}
