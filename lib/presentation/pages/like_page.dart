part of 'pages.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (contex, state) {
      if (state is ListFavNewsLoaded) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          itemCount: state.value.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailNewsPage(
                  news: state.value[index],
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  bottom: (index == state.value.length - 1) ? 100 : 15),
              child: ListNewsWidget(
                news: state.value[index],
              ),
            ),
          ),
        );
      } else if (state is ListFavNewsFailLoaded) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.heart,
              color: primaryColor,
              size: 30,
            ),
          ],
        );
      }
      return SizedBox(
        height: MediaQuery.of(context).size.height * 1 / 2.6,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: dummyItem.length,
          itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                  bottom: (index == dummyItem.length - 1) ? 100 : 15),
              child: const ShimmerListNewsWidget()),
        ),
      );
    });
  }
}
