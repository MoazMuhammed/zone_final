import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone_final/blocs/active_user/active_user_bloc.dart';
import 'package:zone_final/blocs/all_products_one/all_products_one_bloc.dart';
import 'package:zone_final/blocs/landing_page/landing_page_bloc.dart';
import 'package:zone_final/screens/landing_page.dart';
import 'blocs/address/address_bloc.dart';
import 'blocs/products_one_choice/products_one_choice_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zone',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<AllProductsOneBloc>(
                create: (context)=> AllProductsOneBloc()
            ),
            BlocProvider<ProductsOneChoiceBloc>(
                create: (context)=> ProductsOneChoiceBloc()
            ),
            BlocProvider<LandingPageBloc>(
                create: (context)=> LandingPageBloc()
            ),
            BlocProvider<AddressBloc>(
                create: (context)=> AddressBloc()
            ),
            BlocProvider<ActiveUserBloc>(
                create: (context)=> ActiveUserBloc()
            ),
          ],
          child: const LandingScreen()),
    );
  }
}


