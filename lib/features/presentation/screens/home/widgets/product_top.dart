import 'package:flippy/features/presentation/widgets/product_item.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

import 'view_all.dart';

class BestSellersTop extends StatelessWidget {
  final items = <ProductItem>[
    ProductItem(
      id: 0,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
      weight: 1,
    ),
    ProductItem(
      id: 1,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
      weight: 1,
    ),
    ProductItem(
      id: 2,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
      weight: 1,
    ),
    ProductItem(
      id: 3,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
    ),
    ProductItem(
      id: 4,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(title: S.of(context).BEST_SELLER, route: ""),
        _ProductTop(items: items),
      ],
    );
  }
}

class FruitsTop extends StatelessWidget {
  final items = <ProductItem>[
    ProductItem(
      id: 0,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
      weight: 1,
    ),
    ProductItem(
      id: 1,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
      weight: 1,
    ),
    ProductItem(
      id: 2,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
      weight: 1,
    ),
    ProductItem(
      id: 3,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
    ),
    ProductItem(
      id: 4,
      image: "assets/dummy/cabage.png",
      name: "Mushrooms",
      price: 100.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(title: "Fruits", route: ""),
        _ProductTop(items: items),
      ],
    );
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
