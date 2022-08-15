import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:will_design_system/will_design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  final tabs = ['All', 'Action', 'Adventure', 'Fanny', 'Hollywood'];
  int tabSelected = 0;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      child: Stack(
        children: [
          Scaffold(
            body: DefaultTabController(
              length: 4,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: ColorPalettes.black,
                    leading: DSIconButton(
                      AssetSvg.menu,
                      color: ColorPalettes.white,
                      width: 22,
                      height: 22,
                      onPressed: () {},
                    ),
                    actions: [
                      DSIconButton(
                        AssetSvg.notifications,
                        color: ColorPalettes.white,
                        width: 22,
                        height: 22,
                        onPressed: () {},
                      ),
                      DSIconButton(
                        AssetSvg.moreHoriz,
                        color: ColorPalettes.white,
                        width: 22,
                        height: 22,
                        onPressed: () {},
                      ),
                    ],
                    // pinned: true,
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search movie, series...',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                DSIconButton(
                                  AssetSvg.search,
                                  color: ColorPalettes.white,
                                  width: 26,
                                  height: 26,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      DSTabBar(
                        tabItems: tabs,
                        onTabChanged: (index) {
                          // pageController.animateToPage(
                          //   index,
                          //   duration: const Duration(milliseconds: 500),
                          //   curve: Curves.fastOutSlowIn,
                          // );
                          // setState(() => tabSelected = index);
                        },
                      ),
                    ),
                    pinned: true,
                  ),
                ],
                body: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeView(tabs: tabs),
                    ListView.separated(
                      itemBuilder: (context, index) => Text('Item $index'),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: 30,
                    ),
                    Scaffold(body: Center(child: Text(tabs[1]))),
                    Scaffold(body: Center(child: Text(tabs[2]))),
                  ],
                ),
              ),
            ),
          ),
          DSBottomNavigationBar(
            pageController,
            currentPage: currentPage,
            onPageChanged: (value) {
              pageController.animateToPage(
                value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
              setState(() => currentPage = value);
            },
          ),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;
  final List<String> images = [
    'https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg',
    'https://static.wikia.nocookie.net/half-life/images/f/f3/Gordon_Freeman_%28Template%29.jpg/revision/latest?cb=20191221105246&path-prefix=en',
    'https://wallpaperaccess.com/full/2637581.jpg',
    'https://cdn.ome.lt/MuFVANVAL8ZTYgEdssaPbihhL2w=/1200x630/smart/extras/conteudos/SWAT_4_capa.jpg',
    'https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ColorPalettes.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            DSCarousel(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              data: images,
              autoPlay: false,
              height: 215,
              itemBuilder: (context, index) {
                return DSCard(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.only(left: 3, right: 3, bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DSText('Popular', style: textTheme.displayMedium),
                  DSIcon(
                    AssetSvg.moreHoriz,
                    width: 22,
                    height: 22,
                    color: ColorPalettes.lightPrimary,
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DSCardMovie(
                    images[2],
                    title: 'Avatar (Eng)',
                    subtitle: '4.5',
                    description: '50M+Views',
                  ),
                  const SizedBox(width: 20),
                  DSCardMovie(
                    images[3],
                    title: 'Avatar (Eng)',
                    subtitle: '4.5',
                    description: '50M+Views',
                  ),
                  const SizedBox(width: 20),
                  DSCardMovie(
                    images[4],
                    title: 'Avatar (Eng)',
                    subtitle: '4.5',
                    description: '50M+Views',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DSText('You may like', style: textTheme.displayMedium),
                  DSIcon(
                    AssetSvg.moreHoriz,
                    width: 22,
                    height: 22,
                    color: ColorPalettes.lightPrimary,
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DSCardMovie(
                    images[1],
                    title: 'Avatar (Eng)',
                    subtitle: '4.5',
                    description: '50M+Views',
                  ),
                  const SizedBox(width: 20),
                  DSCardMovie(
                    images[0],
                    title: 'Avatar (Eng)',
                    subtitle: '4.5',
                    description: '50M+Views',
                  ),
                  const SizedBox(width: 20),
                  DSCardMovie(
                    images[3],
                    title: 'Avatar (Eng)',
                    subtitle: '4.5',
                    description: '50M+Views',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double? height;

  _SliverAppBarDelegate(this.child, {this.height});

  @override
  double get minExtent => AppBar().preferredSize.height;
  @override
  double get maxExtent => AppBar().preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height ?? maxExtent,
      color: ColorPalettes.black,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
