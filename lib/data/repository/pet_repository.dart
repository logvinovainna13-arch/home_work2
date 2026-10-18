import 'package:dio/dio.dart';

class PetRepository{
  final Dio _dio = Dio();

  Future<String> getRandomDogImage() async {
    _dio.interceptors.add(TalkerDioLogger());
    final Response response = await _dio.get(
        'https://api.thecatapi.com/v1/images/search',
    );

    return response.data.first['url'];

  }
}