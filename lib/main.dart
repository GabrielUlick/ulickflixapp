import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:app_filmes/application/movie_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults(<String, dynamic>{
    'api_token': 'default_value', // Adicione um valor padrão para depuração
  });
  await remoteConfig.fetchAndActivate();
  
  // Verifique o valor do api_token
  final apiToken = remoteConfig.getString('api_token');
  print('API Token: $apiToken'); // Adicione este log para verificar o valor do api_token

  runApp(MovieApp());
}