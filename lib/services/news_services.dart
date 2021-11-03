part of 'services.dart';

class NewsServices {
  static CollectionReference favoritesCollection =
      FirebaseFirestore.instance.collection('favorites');

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
          param,
    );

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

  static Future<void> setFavorite(News news) async {
    String? uid = await getUid();
    favoritesCollection.add({
      'title': news.title,
      'author': news.author,
      'urlToImage': news.urlToImage,
      'content': news.content ?? 'No Content',
      'publishedAt': news.publishedAt,
      'description': news.description,
      'uid': uid
    });
  }

  static Future<String> getUid() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    String? uid = _pref.getString('uid');
    return uid!;
  }

  static Future<ReturnValue> getFavoriteNews() async {
    QuerySnapshot snapshot = await favoritesCollection.get();
    String? uid = await getUid();

    var documents = snapshot.docs.where((element) => element.get('uid') == uid);

    if (documents.isNotEmpty) {
      List<News> listFavNews = documents
          .map(
            (e) => News(
                author: e.get('author'),
                title: e.get('title'),
                description: e.get('description'),
                publishedAt: DateTime.now(),
                content: e.get('content'),
                urlToImage: e.get('urlToImage')),
          )
          .toList();
      return ReturnValue(value: listFavNews);
    } else {
      return ReturnValue(message: 'Data kosong');
    }
  }
}
