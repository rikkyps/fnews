part of 'pages.dart';

class DetailNewsPage extends StatelessWidget {
  final News news;
  final bool isLove;
  const DetailNewsPage({Key? key, required this.news, this.isLove = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //PHOTO
            Container(
              height: MediaQuery.of(context).size.height * 1 / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      news.urlToImage!,
                    ),
                    fit: BoxFit.cover),
              ),
            ),

            //CONTENT
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 1 / 1.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 2.2,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      children: [
                        Text(
                          (news.content != null)
                              ? news.content!
                              : 'Tidak ada content',
                          style: subHeadingTextStyle.copyWith(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //TITLE
            Container(
              margin: const EdgeInsets.only(top: 200, right: 24, left: 24),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 135,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      (news.title != null) ? news.title! : '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: subHeadingTextStyle.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    (news.author != null)
                        ? 'Created by ' + news.author!
                        : 'Created by  No name',
                    style: subHeadingTextStyle.copyWith(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),

            //BUTTON BACK
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 8, left: 24),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),

      //BUTTON LOVE
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(
          FontAwesomeIcons.heart,
          size: 24,
        ),
        onPressed: () {
          NewsServices.setFavorite(news);
        },
        backgroundColor: (isLove) ? primaryColor : Colors.grey,
      ),
    );
  }
}
