import 'package:badges/badges.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_cubit.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_state.dart';
import 'package:flippy/features/presentation/screens/cart/cart_screen.dart';
import 'package:flippy/features/presentation/screens/categories/categories_screen.dart';
import 'package:flippy/features/presentation/screens/home/home_screen.dart';
import 'package:flippy/features/presentation/screens/profile/profile_screen.dart';
import 'package:flippy/features/presentation/screens/search/search_screen.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabNavigationItem {
  final Widget screen;
  final BottomNavigationBarItem item;

  TabNavigationItem({
    required this.screen,
    required this.item,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          screen: HomeScreen(),
          item: BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.current.HOME,
          ),
        ),
        TabNavigationItem(
          screen: SearchScreen(),
          item: BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: S.current.SEARCH,
          ),
        ),
        TabNavigationItem(
          screen: CategoriesScreen(),
          item: BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: S.current.CATEGORIES,
          ),
        ),
        TabNavigationItem(
          screen: CartScreen(),
          item: BottomNavigationBarItem(
            icon: Badge(
              position: BadgePosition.topEnd(top: -8, end: -10),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  var count = 0;
                  if (state is CartLoadedState) {
                    count = state.cartEntity.products.length;
                  }
                  return Text(
                    count.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  );
                },
              ),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            label: S.current.CART,
          ),
        ),
        TabNavigationItem(
          screen: ProfileScreen(),
          item: BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: S.current.PROFILE,
          ),
        )
      ];
}
