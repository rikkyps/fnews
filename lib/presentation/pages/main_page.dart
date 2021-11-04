part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavbarIndex;
  const MainPage({Key? key, this.bottomNavbarIndex = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? buttomNavBarIndex;
  PageController? pageController;

  @override
  void initState() {
    super.initState();

    buttomNavBarIndex = widget.bottomNavbarIndex;
    pageController = PageController(initialPage: buttomNavBarIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  buttomNavBarIndex = index;
                });
              },
              children: [
                BlocProvider(
                    create: (context) => NewsBloc()..add(StartNewsEvent()),
                    child: const NewsPage()),
                BlocProvider(
                    create: (context) => NewsBloc()..add(LoadFavNewsEvent()),
                    child: const LikePage()),
                ProfilePage(),
              ],
            ),

            //BOTTOM NAVBAR
            Positioned(
              bottom: 10,
              left: 28,
              right: 28,
              child: Container(
                width: MediaQuery.of(context).size.width - 56,
                height: 74,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  currentIndex: buttomNavBarIndex!,
                  iconSize: 18,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    setState(() {
                      buttomNavBarIndex = index;
                      pageController!.jumpToPage(index);
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: '',
                      icon: FaIcon(FontAwesomeIcons.home,
                          size: 24,
                          color: (buttomNavBarIndex == 0)
                              ? primaryColor
                              : Colors.grey),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: FaIcon(FontAwesomeIcons.heart,
                          size: 24,
                          color: (buttomNavBarIndex == 1)
                              ? primaryColor
                              : Colors.grey),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: FaIcon(FontAwesomeIcons.user,
                          size: 24,
                          color: (buttomNavBarIndex == 2)
                              ? primaryColor
                              : Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
