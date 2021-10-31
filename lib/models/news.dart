part of 'models.dart';

class News {
  final String? title;
  final String? author;
  final String? description;
  final DateTime? publishedAt;
  final String? urlToImage;
  final String? content;

  News(
      {this.title,
      this.author,
      this.description,
      this.publishedAt,
      this.urlToImage,
      this.content});

  factory News.fromJson(Map<String, dynamic> data) => News(
        title: data['title'],
        author: data['author'],
        description: data['description'],
        publishedAt: DateTime.now(),
        urlToImage: data['urlToImage'],
        content: data['content'],
      );
}

List<News> listNews = [
  News(
      title:
          "Cara Bertahan Menghadapi Gelombang Ketiga Covid-19 - Pikiran Rakyat Bogor - Pikiran Rakyat Bogor",
      author: "Tuti Riyanti",
      description:
          "Simak cara bertahan menghadapi gelombang ketiga Covid-19 menurut dokter Sandra Sinthya Langow. Semua orang pasti tidak mengharapkan.",
      content:
          "PR BOGOR - Simak cara bertahan menghadapi gelombang ketiga Covid-19 menurut dokter Sandra Sinthya Langow.\r\nSemua orang pasti tidak mengharapkan adanya gelombang ketiga dari Covid-19.\r\nWalaupun sekara… [+684 chars]",
      publishedAt: DateTime.now(),
      urlToImage:
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2021/10/24/592830569.jpg"),
  News(
      title:
          "Cara Bertahan Menghadapi Gelombang Ketiga Covid-19 - Pikiran Rakyat Bogor - Pikiran Rakyat Bogor",
      author: "Tuti Riyanti",
      description:
          "Simak cara bertahan menghadapi gelombang ketiga Covid-19 menurut dokter Sandra Sinthya Langow. Semua orang pasti tidak mengharapkan.",
      content:
          "PR BOGOR - Simak cara bertahan menghadapi gelombang ketiga Covid-19 menurut dokter Sandra Sinthya Langow.\r\nSemua orang pasti tidak mengharapkan adanya gelombang ketiga dari Covid-19.\r\nWalaupun sekara… [+684 chars]",
      publishedAt: DateTime.now(),
      urlToImage:
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2021/10/24/592830569.jpg"),
  News(
      title:
          "Cara Bertahan Menghadapi Gelombang Ketiga Covid-19 - Pikiran Rakyat Bogor - Pikiran Rakyat Bogor",
      author: "Tuti Riyanti",
      description:
          "Simak cara bertahan menghadapi gelombang ketiga Covid-19 menurut dokter Sandra Sinthya Langow. Semua orang pasti tidak mengharapkan.",
      content:
          "PR BOGOR - Simak cara bertahan menghadapi gelombang ketiga Covid-19 menurut dokter Sandra Sinthya Langow.\r\nSemua orang pasti tidak mengharapkan adanya gelombang ketiga dari Covid-19.\r\nWalaupun sekara… [+684 chars]",
      publishedAt: DateTime.now(),
      urlToImage:
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2021/10/24/592830569.jpg")
];
