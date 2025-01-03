import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config.dart';
import '../../routes/index.dart';
import '../../screens/bottom_screens/cart_screen/cart_screen.dart';
import '../../screens/bottom_screens/category_screen/category_screen.dart';
import '../../screens/bottom_screens/home_screen/home_screen.dart';
import '../../screens/bottom_screens/profile_screen/profile_screen.dart';
import '../../screens/bottom_screens/wishlist_screen/wishlist_screen.dart';

class DashboardProvider with ChangeNotifier {
  int currentIndex = 0;
  TabController? tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool? isProfile = false;
  bool isBack = false;

  final List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const WishListScreen(),
    const ProfileScreen()
  ];

  //tab on view and load page
  void initTabController(TickerProviderStateMixin vsync, context) {
    tabController = TabController(length: pages.length, vsync: vsync);
    currentIndex = tabController!.index;
    notifyListeners();
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    isBack = data ?? false;
  }

  //dispose call
  onDispose() {
    tabController!.dispose();
    notifyListeners();
  }

//change tab
  void changeTab(int index, context) {
    currentIndex = index;
    if (currentIndex == 2) {
      currentIndex = 0;
      tabController!.animateTo(0,
          duration: const Duration(milliseconds: 1), curve: Curves.ease);
      Navigator.pushNamed(
        context,
        routeName.cartView,
      );
      notifyListeners();
    }
    notifyListeners();
  }

  //move tab
  void moveTab(context, int index, {isBack = false}) async {
    if (isBack) {
      route.pop(context);
    } else {
      currentIndex = index;
      tabController!.animateTo(index,
          duration: const Duration(milliseconds: 1), curve: Curves.ease);
      notifyListeners();
    }
  }

//device back press
  onBackPress(index) async {
    if (index == 0) {
      SystemNavigator.pop();
    }
  }

  //list tap event
  onTapList(dynamic data, BuildContext context) {
    if (data['title'] == appFonts.pageList ||
        data['title'] == appFonts.setting ||
        data['title'] == appFonts.logout || data['title'] == appFonts.Complete_profile) {
      route.pushNamed(context, data['route']);
    }
  }
}
