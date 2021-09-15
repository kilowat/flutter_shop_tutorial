import 'package:flippy/features/domain/entities/product_entity.dart';
import 'package:flippy/features/presentation/bloc/product/product_list_cubit.dart';
import 'package:flippy/features/presentation/bloc/product/product_list_state.dart';
import 'package:flippy/features/presentation/widgets/product_item.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view_all.dart';

class BestSellersTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      builder: (context, state) {
        if (state is ProductListLoadedState) {
          return Column(
            children: [
              ViewAll(title: S.of(context).BEST_SELLER, route: ""),
              _ProductTop(
                items: _buildItems(
                  state.productList,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  List<ProductItem> _buildItems(List<ProductEntity> productList) {
    return productList
        .map(
          (product) => ProductItem(
            id: product.id,
            image: product.image,
            name: product.name,
            price: product.price,
            category: product.category,
          ),
        )
        .take(6)
        .toList();
  }
}

class FruitsTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      builder: (context, state) {
        if (state is ProductListLoadedState) {
          return Column(
            children: [
              ViewAll(title: "Фрукты", route: ""),
              _ProductTop(
                items: _buildItems(
                  state.productList,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  List<ProductItem> _buildItems(List<ProductEntity> productList) {
    return productList
        .map(
          (product) => ProductItem(
            id: product.id,
            image: product.image,
            name: product.name,
            price: product.price,
            category: product.category,
          ),
        )
        .where((element) => element.category == 4)
        .toList();
  }
}

class _ProductTop extends StatelessWidget {
  final List<ProductItem> items;

  const _ProductTop({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Row(
          children: items
              .map(
                (item) => Container(
                  width: size.width * 0.33,
                  margin: EdgeInsets.only(left: 4),
                  child: item,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
