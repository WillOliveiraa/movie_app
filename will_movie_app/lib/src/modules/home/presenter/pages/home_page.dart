import 'dart:ui';

import 'package:core_module/core_module.dart';
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
                    backgroundColor: AppColors.black,
                    leading: DSIconButton(
                      AssetSvg.items,
                      color: AppColors.white,
                      onPressed: () {},
                    ),
                    actions: [
                      DSIconButton(
                        AssetSvg.notification,
                        color: AppColors.white,
                        width: 22.w,
                        height: 22.h,
                        onPressed: () {},
                      ),
                      DSIconButton(
                        AssetSvg.moreHoriz,
                        color: AppColors.white,
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
                                  color: AppColors.white,
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
                      DSTabBar(tabItems: tabs),
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
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            DSCarousel(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              data: images,
              autoPlay: false,
              height: 215.h,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    DSCard(
                      padding: const EdgeInsets.all(0),
                      margin:
                          EdgeInsets.only(left: 3.w, right: 3.w, bottom: 15.h),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      ),
                    ),
                    Positioned(
                      left: Spacing.x5.w,
                      bottom: Spacing.x8.h,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DSText(
                                'Maleficent HD',
                                style: textTheme.bodyLarge,
                                margin: EdgeInsets.only(bottom: Spacing.x1.h),
                              ),
                              Row(
                                children: [
                                  DSIcon(
                                    AssetSvg.star,
                                    margin:
                                        EdgeInsets.only(right: Spacing.x1.w),
                                    color: AppColors.yellow,
                                  ),
                                  DSText(
                                    '4.9',
                                    style: textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: Spacing.x5.w,
                      bottom: Spacing.x8.h,
                      child: SizedBox(
                        width: 54.w,
                        height: 54.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              margin: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Icon(
                                Icons.play_arrow,
                                color: AppColors.lightPrimary,
                                size: Spacing.x7.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    color: AppColors.lightPrimary,
                  )
                ],
              ),
            ),
            Container(
              height: 200.h,
              margin: EdgeInsets.symmetric(horizontal: Spacing.x4.w),
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
              padding: EdgeInsets.symmetric(
                  horizontal: Spacing.x4.w, vertical: Spacing.x5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DSText('You may like', style: textTheme.displayMedium),
                  DSIcon(
                    AssetSvg.moreHoriz,
                    color: AppColors.lightPrimary,
                  )
                ],
              ),
            ),
            Container(
              height: 200.h,
              margin: EdgeInsets.symmetric(horizontal: Spacing.x4.w),
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
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double? height;

  // ignore: unused_element
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
      color: AppColors.black,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
