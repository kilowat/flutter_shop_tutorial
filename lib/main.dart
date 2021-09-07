import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flippy/common/main_theme.dart';
import 'package:flippy/features/data/datasources/cart_local_data_source.dart';
import 'package:flippy/features/data/datasources/category_remote_data_source.dart';
import 'package:flippy/features/data/repositories/cart_repository_impl.dart';
import 'package:flippy/features/data/repositories/category_repository_impl.dart';
import 'package:flippy/features/domain/usecases/add_to_cart.dart';
import 'package:flippy/features/domain/usecases/get_all_category.dart';
import 'package:flippy/features/domain/usecases/get_cart.dart';
import 'package:flippy/features/presentation/bloc/cart/cart_cubit.dart';
import 'package:flippy/features/presentation/bloc/category/category_list_cubit.dart';
import 'package:flippy/features/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/presentation/bloc/cart/cart_state.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    FlippyApp(), // Wrap your app
  );
}

class FlippyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (theme, dark) => MultiBlocProvider(
        providers: [
          BlocProvider<CategoryListCubit>(
            create: (context) => CategoryListCubit(
              getAllCategory: GetAllCategory(
                CategoryRepositoryImpl(
                  dataSource: FileCategoryRemoteDataSource(),
                ),
              ),
            ),
          ),
          BlocProvider<CartCubit>(
            create: (context) {
              final cartRepo = CartRepositoryImpl(
                localDataSource: PreferencesCartDataSource(),
              );
              return CartCubit(
                addToCart: AddToCart(cartRepo),
                getCart: GetCart(cartRepo),
              )..load();
            },
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter Demo',
          theme: theme,
          darkTheme: dark,
          initialRoute: '/',
          routes: {},
          home: BlocListener<CartCubit, CartState>(
            listenWhen: (previousState, state) {
              return state is CartLoadedState && state.isAdded;
            },
            listener: (context, state) {
              showDialog<String>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Product added'),
                  content: const Text('Product with name added'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
