part of 'widgets.dart';

class LatestNewsWidget extends StatelessWidget {
  final News news;
  const LatestNewsWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        image: DecorationImage(
            image: NetworkImage(
                (news.urlToImage != null) ? news.urlToImage! : dummyNews),
            fit: BoxFit.cover),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 3 / 3.5,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                (news.author != null) ? 'by ' + news.author! : 'No Name',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: subHeadingTextStyle.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                news.title!,
                overflow: TextOverflow.clip,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                news.description!,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: headingTextStyle.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
