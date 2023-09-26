import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/data/stores_handler.dart';
import 'package:zone_final/models/categories_models.dart';

import '../blocs/all_products_one/all_products_one_bloc.dart';
import '../colors.dart';
import 'all_shops_one/element_shop_grid.dart';
import 'all_shops_one/element_shop_list.dart';
import 'cart.dart';

class AllShopsOne extends StatefulWidget {
  final ShopCategory category;
  const AllShopsOne({Key? key,required this.category}) : super(key: key);

  @override
  State<AllShopsOne> createState() => _AllShopsOneState();
}

class _AllShopsOneState extends State<AllShopsOne> {
  bool isList = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllProductsOneBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          actions: [
            BlocBuilder<AllProductsOneBloc, AllProductsOneState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    BlocProvider.of<AllProductsOneBloc>(context)
                        .add(SearchToggleEvent());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_alt,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, PageTransition(
                  child: const Cart(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                ));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20,),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.07,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: BlocBuilder<AllProductsOneBloc, AllProductsOneState>(
                      builder: (context, state) {
                        if (state is AllProductsOneChanged) {
                          return Visibility(
                              visible: state.searchActivated,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 2,
                                            style: BorderStyle.solid)),
                                    hintText: 'search',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 2,
                                            style: BorderStyle.solid))),
                              ));
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.category.name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width* 0.15,
                        height: MediaQuery.of(context).size.height* 0.07,
                        decoration: BoxDecoration(
                          color: productElement1,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isList = true;
                                });
                              },
                              icon: Icon(Icons.list,color: (isList)?zoneColor2:Colors.black,)
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width* 0.15,
                        height: MediaQuery.of(context).size.height* 0.07,
                        decoration: BoxDecoration(
                          color: productElement1,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isList = false;
                                });
                              },
                              icon: Icon(Icons.grid_on,color: (!isList)?zoneColor2:Colors.black,)
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: FutureBuilder(
                  future: getShopsByCategoryId(widget.category.id!),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      if(snapshot.data!.isNotEmpty){
                        return SizedBox(
                          width: double.infinity,
                          child: (isList)?getShopsList(context: context,shops: snapshot.data!)
                              :getShopsGrid(context: context,shops: snapshot.data!),
                        );
                      }else{
                        return const SizedBox();
                      }
                    }else{
                      return CircularProgressIndicator(
                        color: zoneColor1,
                        strokeWidth: 5,
                      );
                    }

                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
