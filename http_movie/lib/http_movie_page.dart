import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http_movie/http_movie_dto.dart';
import 'package:http_movie/http_movie_item.dart';
import 'package:http_movie/http_movie_repository.dart';

class HttpMoviePage extends HookWidget {
  const HttpMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<HttpMovieDTO>>([]);
    useEffect((){
      HttpMovieRepository.getDTO().then((value){
        listState.value = value ?? [];
      });
    },[]);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value.map((e) => HttpMovieItem(httpMovieDTO: e)).toList(),
        ),
      ),
    );
  }
}
