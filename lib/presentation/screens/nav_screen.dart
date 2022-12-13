import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/presentation/constants/constants.dart';
import '/presentation/screens/screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    ShopScreen(key: PageStorageKey('ShopScreen')),
    ExploreScreen(key: PageStorageKey('ExploreScreen')),
    CartScreen(key: PageStorageKey('CartScreen')),
    FavoriteScreen(key: PageStorageKey('FavoriteScreen')),
    AccountScreen(key: PageStorageKey('AacountScreen')),
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
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: SizedBox(
              height: AppSize.s70,
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: ColorManager.white,
                  elevation: 3,
                  items: _icons
                      .map((title, icon) => MapEntry(
                          title,
                          BottomNavigationBarItem(
                            icon: Icon(icon, size: 30.0),
                            label: title,
                          )))
                      .values
                      .toList(),
                  currentIndex: _currentIndex,
                  selectedItemColor: ColorManager.green,
                  selectedFontSize: FontSize.fs12,
                  unselectedFontSize: FontSize.fs12,
                  unselectedItemColor: ColorManager.black,
                  onTap: (index) => setState(() => _currentIndex = index)),
            ),
          ),
        ));
  }
}
