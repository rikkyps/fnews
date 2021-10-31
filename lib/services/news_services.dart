part of 'services.dart';

class NewsServices {
  static Future<ReturnValue> getHeadlineNews() async {
    var endPoint = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=' +
            apiKey +
            '&pageSize=20');

    var request = await http.get(endPoint);

    if (request.statusCode == 200) {
      var result = jsonDecode(request.body);

      List<News> news = (result['articles'] as Iterable)
          .map((e) => News.fromJson(e))
          .toList();
      return ReturnValue(value: news);
    } else {
      return ReturnValue(message: 'Berita gagal dimuat!');
    }
  }

  static Future<ReturnValue> getListNews(String param) async {
    var endPoint = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=' +
            apiKey +
            '&pageSize=20&category=' +
            param);

    var request = await http.get(endPoint);

    if (request.statusCode == 200) {
      var result = jsonDecode(request.body);

      List<News> news = (result['articles'] as Iterable)
          .map((e) => News.fromJson(e))
          .toList();
      return ReturnValue(value: news);
    } else {
      return ReturnValue(message: 'Berita gagal dimuat!');
    }
  }
}
