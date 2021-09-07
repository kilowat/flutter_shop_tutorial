import 'package:badges/badges.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_cubit.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_state.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  final int index;

  const BottomNavBar({Key? key, this.index = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BottomNavigationBar(
      onTap: (index) {},
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).accentColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: s.HOME,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: s.SEARCH,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps),
          label: s.CATEGORIES,
        ),
        BottomNavigationBarItem(
          icon: Badge(
            position: BadgePosition.topEnd(top: -8, end: -10),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                var count = 0;
                if (state is CartLoadedState) {
                  count = state.cartEntity.count;
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
          label: s.CART,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: s.PROFILE,
        ),
      ],
    );
  }
}
