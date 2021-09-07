import 'package:flippy/common/styles.dart';
import 'package:flippy/features/domain/entities/category_entity.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_cubit.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_state.dart';
import 'package:flippy/features/presentation/widgets/category_item.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view_all.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoryListCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ViewAll(
            title: S.of(context).ALL_CATEGORIES,
            route: "/",
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Styles.paddingDefault / 2,
                right: Styles.paddingDefault / 2),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<CategoryListCubit, CategoryState>(
                builder: (context, state) => _mapState(context, state),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _mapState(BuildContext context, CategoryState state) {
    if (state is CategoryLoadedState) {
      return _buildCategories(context, state.categories);
    } else if (state is CategoryLoadingState) {
      return _buildPreloadCategories(context);
    } else {
      return Container();
    }
  }

  _buildCategories(BuildContext context, List<CategoryEntity> categories) {
    final items = categories
        .map(
          (category) => CategoryItem(
            id: category.id,
            image: category.image,
            name: category.name,
          ),
        )
        .toList();
    return Row(
      children: items,
    );
  }

  _buildPreloadCategories(BuildContext context) {
    final items = Iterable.generate(6)
        .map(
          (category) => CategoryPlaceHolder(),
        )
        .toList();
    return Row(
      children: items,
    );
  }
}
