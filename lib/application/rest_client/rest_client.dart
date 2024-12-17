import 'package:get/get_connect.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://api.themoviedb.org/3';
    httpClient.addRequestModifier<void>((request) async {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.fetchAndActivate();
      final apiToken = remoteConfig.getString('api_token');
      request.headers['Authorization'] = 'Bearer $apiToken';
      return request;
    });
  }
}