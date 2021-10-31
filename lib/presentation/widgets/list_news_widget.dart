part of 'widgets.dart';

class ListNewsWidget extends StatelessWidget {
  final News news;
  const ListNewsWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width * 1 / 3) - 5 - 15,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: NetworkImage(
                      (news.urlToImage != null) ? news.urlToImage! : dummyNews),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width * 2 / 3) - 5 - 15,
                child: Text(
                  news.title!,
                  style: subHeadingTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.people, size: 16, color: Colors.grey),
                  Text(
                    (news.author != null) ? news.author! : 'No Name',
                    style: subHeadingTextStyle.copyWith(
                        fontSize: 12, color: Colors.grey),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
