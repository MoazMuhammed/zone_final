import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone_final/screens/all_products_two/element_categories_two.dart';
import '../blocs/all_products_one/all_products_one_bloc.dart';
import '../blocs/products_one_choice/products_one_choice_bloc.dart';
import '../data/all_products_data.dart';
import 'all_products_two/element_product_two.dart';

class AllProductsTwo extends StatelessWidget {
  const AllProductsTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductsOneBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsOneChoiceBloc(),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
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
                  icon:  const Icon(
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
              onPressed: () {},
              icon: const  Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.07,
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Image.asset(
                        'images/pastry_logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: DropdownButton(
                          elevation: 0,
                          underline: const SizedBox(),
                          value: 'sort by',
                          items: const [
                            DropdownMenuItem(
                              value: 'sort by',
                              child: Text('sort by'),
                            ),
                            DropdownMenuItem(
                              value: 'name',
                              child: Text('name'),
                            ),
                            DropdownMenuItem(
                              value: 'price',
                              child: Text('price'),
                            ),
                            DropdownMenuItem(
                              value: 'latest',
                              child: Text('latest'),
                            ),
                          ],
                          onChanged: (value) {}),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: BlocBuilder<ProductsOneChoiceBloc, ProductsOneChoiceState>(
                  builder: (context, state) {
                    if (state is ProductsOneChoiceChanged) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  BlocProvider.of<ProductsOneChoiceBloc>(context)
                                      .add(ChangeSubCategoryEvent(
                                          newSubCategory: index));
                                },
                                child: ElementCategories2(
                                  categoryName: categoriesList[index]['name'],
                                  isChosen: state.subCategoryIndex == index,
                                ),
                              ));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<ProductsOneChoiceBloc,
                        ProductsOneChoiceState>(
                      builder: (context, state) {
                        if (state is ProductsOneChoiceChanged) {
                          return getProducts2(
                              index: state.subCategoryIndex, context: context);
                        } else {
                          return const SizedBox();
                        }
                      },
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
