import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../api.dart';
import '../model/Video.dart';

class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late YoutubePlayerController _controller;
  bool isVideoReady = false;
  String? videoIdToPlay;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '', // Vídeo inicial vazio
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,

      ),
    );
  }

  void playVideo(String videoId) {
    setState(() {
      videoIdToPlay = videoId;
      isVideoReady = true;
    });
  }

  Future<List<Video>?> _listarVideos(String pesquisa) async {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isVideoReady
            ? YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
          onReady: () {
            _controller.load(videoIdToPlay!);
          },
        )
            : FutureBuilder<List<Video>?>(
          future: _listarVideos(widget.pesquisa),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("Nenhuma informação a ser exibida"),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];

                      return GestureDetector(
                        onTap: () {
                          playVideo(video.id);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(video.imagem),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 2,
                      color: Colors.red,
                    ),
                    itemCount: snapshot.data!.length,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Erro ao carregar os dados: ${snapshot.error}"),
                  );
                } else {
                  return Center(
                    child: Text("Nenhum dado a ser exibido"),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
