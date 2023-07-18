import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '/all_path.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _screens = const [
    ShopScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];
  final Map<String, IconData> _icons = const {
    'Shop': Icons.shopping_bag_outlined,
    'Explore': Icons.explore_outlined,
    'Cart': Icons.add_shopping_cart_outlined,
    'Favorite': Icons.favorite_outline,
    'Account': Icons.person_outline_outlined,
  };
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 30,
                  color: ColorManager.black.withOpacity(.4),
                  offset: const Offset(0, 25),
                )
              ],
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: SizedBox(
                height: AppSize.s70,
                child: GNav(
                    tabs: _icons
                        .map((title, icon) => MapEntry(
                            title,
                            GButton(
                              icon: icon,
                              text: title,
                            )))
                        .values
                        .toList(),
                    curve: Curves.easeInOut,
                    iconSize: 24,
                    gap: 8,
                    tabBackgroundColor: ColorManager.green,
                    selectedIndex: _currentIndex,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    activeColor: ColorManager.white,
                    color: ColorManager.black,
                    onTabChange: (index) =>
                        setState(() => _currentIndex = index)),
              ),
            ),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
