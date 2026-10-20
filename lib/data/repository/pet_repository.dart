import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class PetRepository{
  final Dio _dio = Dio();

  Future<String> getRandomCatImage() async {
    _dio.interceptors.add(TalkerDioLogger());
    final Response response = await _dio.get(
        'https://api.thecatapi.com/v1/images/search',
    );

    return response.data.first['url'];

  }
}