import 'package:flippy/common/styles.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_cubit.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_state.dart';
import 'package:flippy/features/presentation/bloc/product/product_list_cubit.dart';
import 'package:flippy/features/presentation/bloc/product/product_list_state.dart';
import 'package:flippy/features/presentation/screens/category/product_item.dart';
import 'package:flippy/features/presentation/screens/category/search_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'category_tabs.dart';

class Body extends StatelessWidget {
  static const double _headerHeight = 110;
  final int id;
  final String name;

  const Body({Key? key, required this.id, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) =>
          CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildHeader(context, constrains),
          _buildItems(context, constrains),
        ],
      ),
    );
  }

  _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      shadowColor: Colors.transparent,
      centerTitle: true,
      floating: true,
      title: Text(name),
      actions: [
        IconButton(
          visualDensity: VisualDensity(horizontal: 0, vertical: 0),
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/Arrow.svg'),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/filter.svg'),
        ),
      ],
    );
  }

  _buildHeader(BuildContext context, BoxConstraints constrains) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: _headerHeight,
        child: Container(
          padding: EdgeInsets.only(
              left: Styles.paddingDefault, right: Styles.paddingDefault),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              SearchCategory(),
              BlocBuilder<CategoryListCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadedState) {
                    final CategoryEntity category = state.categories
                        .firstWhere((element) => element.id == id);
                    return CategoryTabs(
                      category: category,
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItems(BuildContext context, BoxConstraints constrains) {
    return BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
      if (state is ProductListLoadedState) {
        final productList = state.productList;
        return SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ProductItem(
              id: productList[index].id,
              name: productList[index].name,
              image: productList[index].image,
              price: productList[index].price,
            );
          }, childCount: productList.length),
        );
      } else {
        return Container();
      }
    });
  }
}
