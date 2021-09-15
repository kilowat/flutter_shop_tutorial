import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_cubit.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_state.dart';
import 'package:flippy/features/presentation/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Styles.paddingDefault / 2),
        child: BlocBuilder<CategoryListCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadedState) {
              return Wrap(
                children: state.categories
                    .map((i) =>
                        CategoryItem(id: i.id, image: i.image, name: i.name))
                    .toList(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
