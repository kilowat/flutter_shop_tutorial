import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_cubit.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final String image;

  const ProductItem({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 100,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.fromLTRB(
            Styles.paddingDefault,
            Styles.paddingDefault / 2,
            Styles.paddingDefault,
            Styles.paddingDefault / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 0),
              blurRadius: 4.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(image),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Unit price:",
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                        TextSpan(
                          text: "Rs. $price",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 88,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Baseline(
                                    baselineType: TextBaseline.alphabetic,
                                    baseline: 10,
                                    child: Text(
                                      "-",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '0.2 kg',
                              style: TextStyle(fontSize: 11),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Baseline(
                                    baselineType: TextBaseline.alphabetic,
                                    baseline: 12,
                                    child: Text(
                                      "+",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Material(
                            color: Colors.transparent,
                            child: BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) => InkWell(
                                onTap: () {
                                  context.read<CartCubit>().add(1);
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(18, 2, 18, 4),
                                  child: Center(
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
