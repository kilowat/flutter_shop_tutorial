import 'package:flippy/common/styles.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_cubit.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_state.dart';
import 'package:flippy/features/presentation/screens/category/product_list.dart';
import 'package:flippy/features/presentation/screens/category/search_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_tabs.dart';

class Body extends StatelessWidget {
  static const double _headerHeight = 110;
  final int id;

  const Body({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) => Column(
        children: [
          _buildHeader(context, constrains),
          _buildItems(context, constrains),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context, BoxConstraints constrains) {
    return SizedBox(
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
    );
  }

  _buildItems(BuildContext context, BoxConstraints constrains) {
    final maxHeight = constrains.maxHeight - _headerHeight;
    return LimitedBox(
      maxHeight: maxHeight,
      child: ProductList(),
    );
  }
}
