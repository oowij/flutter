class HttpMovieDTO{
  // rank (랭킹)
  // auiCnt (관객수)
  // movieNm (영화이름)
  // openDt (개봉일)

  String rank;
  String auiCnt;
  String movieNm;
  String openDt;

  HttpMovieDTO({
    required this.rank,
    required this.auiCnt,
    required this.movieNm,
    required this.openDt,
});

  factory HttpMovieDTO.fromJson(dynamic json) => HttpMovieDTO(
    rank: json["rank"],
    auiCnt: json["audiCnt"],
    movieNm: json["movieNm"],
    openDt: json["openDt"],
  );

  static List<HttpMovieDTO> fromJsonList(List jsonList){
    return jsonList.map((e) => HttpMovieDTO.fromJson(e)).toList();
  }
}