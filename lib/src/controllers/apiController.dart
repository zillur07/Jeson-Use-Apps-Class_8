import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  final _dio = Dio();
  final news = Map().obs;
  getNews() async {
    try {
      final newsData = await _dio.get(
          'https://newsapi.org/v2/everything?q=keyword&apiKey=8b7606b1bde34f6aa9d169a5283a6d06');
      // print('Hello world ');
      news.addAll(newsData.data);
      print(newsData.data);
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
