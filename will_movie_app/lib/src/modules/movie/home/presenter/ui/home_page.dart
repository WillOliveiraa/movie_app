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

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      child: Scaffold(
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
              // const SizedBox(height: 10),
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
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                      setState(() => tabSelected = index);
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
                Scaffold(body: Center(child: Text(tabs[3]))),
              ],
            ),
          ),
        ),
        // bottomSheet: Container(
        //   height: 70,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(24),
        //   ),
        //   child: Row(children: const [
        //     Icon(Icons.home),
        //   ]),
        // ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(tabs[0])));
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
