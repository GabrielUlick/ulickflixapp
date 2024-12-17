import 'package:app_filmes/application/rest_client/rest_client.dart';
import 'package:app_filmes/models/genre_model.dart';
import 'package:flutter/material.dart';
import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(
      '/genre/movie/list',
      query: <String, String>{
        'language': 'pt-br',
      },
      decoder: (data) {
        final results = data['genres'];
        if (results != null) {
          return results.map<GenreModel>((genre) => GenreModel.fromMap(genre)).toList();
        }
        return <GenreModel>[];
      },
    );

    if (result.hasError) {
      debugPrint('Erro ao buscar gêneros [${result.statusText}]');
      throw Exception('Erro ao buscar gêneros');
    }
    return result.body ?? <GenreModel>[];
  }
}