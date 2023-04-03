import 'package:flutter/material.dart';
import 'package:http_movie/http_movie_dto.dart';

class HttpMovieItem extends StatelessWidget {
  final HttpMovieDTO httpMovieDTO;
  const HttpMovieItem({Key? key, required this.httpMovieDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(httpMovieDTO.rank),
          Text(httpMovieDTO.auiCnt),
          Text(httpMovieDTO.movieNm),
          Text(httpMovieDTO.openDt),
        ],
      ),
    );
  }
}
