class Video {
  late String id;
  late String titulo;
  late String descricao;
  late String imagem;
  late String canal;

  Video({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.canal,
  });

/*
  static converterJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["ssnippet"]["description"],
      imagem: json["snippet"]["thimbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }*/
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}
