part of 'pages.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<String> listCategories = [
    'business',
    'sports',
    'health',
    'entertainment',
    'general',
    'science',
    'technology'
  ];
  String selectedItem = 'business';
  List<News>? newsResult1;

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is NewsInitial) {
          Timer(const Duration(seconds: 1), () {
            context.read<NewsBloc>().add(LoadHeadlineNewsEvent(selectedItem));
          });
        }
      },
      builder: (context, state) {
        if (state is HeadlineNewsLoadedState) {
          newsResult1 = state.news!;
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),

              //SEARCH BAR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 48,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width * 3 / 4,
                      child: TextField(
                        controller: _searchController,
                        style: GoogleFonts.nunito(
                            fontSize: 14, color: Colors.black87),
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1 / 6,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/btn_lonceng.png'),
                                fit: BoxFit.contain)),
                      ),
                    )
                  ],
                ),
              ),

              //HIGHLIGT NEWS
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Latest News', style: headingTextStyle),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1 / 6,
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'See All',
                                    style: GoogleFonts.nunito(
                                        fontSize: 14,
                                        color: secondColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                    color: secondColor,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    (newsResult1 != null)
                        ? SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: newsResult1!.length,
                              itemBuilder: (_, index) => Container(
                                margin: EdgeInsets.only(
                                    left: (index == 0) ? 15 : 0,
                                    right: (index == newsResult1!.length - 1)
                                        ? 15
                                        : 10),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailNewsPage(
                                                news: newsResult1![index],
                                              ))),
                                  child: LatestNewsWidget(
                                    news: newsResult1![index],
                                  ),
                                ),
                              ),
                            ))
                        : SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dummyItem.length,
                              itemBuilder: (_, index) => Container(
                                  margin: EdgeInsets.only(
                                      left: (index == 0) ? 15 : 0,
                                      right: (index == dummyItem.length - 1)
                                          ? 15
                                          : 10),
                                  child: const ShimmerLatestNewsWidget()),
                            ),
                          )
                  ],
                ),
              ),

              //News Category Section
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCategories.length,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index != 0) ? 0 : 15,
                        right: (index == listCategories.length - 1) ? 15 : 10),
                    child: CategoryWidget(
                      name: listCategories[index],
                      isSelected: (listCategories[index] == selectedItem)
                          ? true
                          : false,
                      onTap: () {
                        setState(() {
                          selectedItem = listCategories[index];
                          context
                              .read<NewsBloc>()
                              .add(LoadListNewsEvent(selectedItem));
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              (state is HeadlineNewsLoadedState)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 2.6,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: state.news2!.length,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailNewsPage(
                                      news: state.news2![index]))),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: (index == state.news2!.length - 1)
                                    ? 100
                                    : 15),
                            child: ListNewsWidget(
                              news: state.news2![index],
                            ),
                          ),
                        ),
                      ),
                    )
                  : (state is ListNewsLoadedState)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 1 / 2.6,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemCount: state.news!.length,
                            itemBuilder: (_, index) => GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DetailNewsPage(
                                          news: state.news![index]))),
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: (index == state.news!.length - 1)
                                        ? 100
                                        : 15),
                                child: ListNewsWidget(
                                  news: state.news![index],
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 1 / 2.6,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemCount: dummyItem.length,
                            itemBuilder: (_, index) => Container(
                                margin: EdgeInsets.only(
                                    bottom: (index == dummyItem.length - 1)
                                        ? 100
                                        : 15),
                                child: const ShimmerListNewsWidget()),
                          ),
                        )
            ],
          ),
        );
      },
    );
  }
}
