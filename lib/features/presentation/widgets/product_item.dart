import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_cubit.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final double price;
  final double weight;
  final int category;

  const ProductItem({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    this.weight = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Stack(
                children: [
                  Positioned(top: 0, right: 0, child: Like()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Weight(1),
                      SizedBox(height: 4),
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 4,
            bottom: 0,
            left: 8,
            right: 8,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: Row(
            children: [
              Text(
                "\$${price}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Spacer(),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 24),
                      primary: Styles.colorPrimary,
                    ),
                    onPressed: () {
                      context.read<CartCubit>().add(id);
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 20,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Weight extends StatelessWidget {
  final int value;

  const Weight([value = 0]) : this.value = value;
  @override
  Widget build(BuildContext context) {
    return value > 0
        ? Container(
            width: 50,
            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black38,
            ),
            child: Center(
              child: Text(
                '$value KG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}

class Like extends StatefulWidget {
  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        'assets/icons/heart.svg',
        color: isAdded ? Theme.of(context).primaryColor : Colors.black45,
      ),
      onTap: () {
        setState(() {
          isAdded = !isAdded;
        });
      },
    );
  }
}
