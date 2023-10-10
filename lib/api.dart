import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBAGxIS4VQqVnjrBXCMCUG2FMcuuApvJE0";
const ID_CANAL = "";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>?> pesquisar(String pesquisa) async {
    try {
      Uri uri = Uri.parse(URL_BASE +
          "search"
              "?part=snippet"
              "&type=video"
              "&maxResults=5"
              "&order=date"
              "&key=$CHAVE_YOUTUBE_API"
              "&channelId=$ID_CANAL"
              "&q=$pesquisa");

      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> dadosJson = json.decode(response.body);

        List<Video> videos = dadosJson["items"].map<Video>((map) {
          return Video.fromJson(map);

        }).toList();

        return videos;
      } else {
        print("Erro na solicitação HTTP: ${response.statusCode}");
        return null; // Retorna null para indicar que ocorreu um erro
      }
    } catch (e) {
      print("Erro ao realizar a solicitação HTTP: $e");
      return null; // Retorna null para indicar que ocorreu um erro
    }
  }
}