import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/screens/single_product_one.dart';
import 'package:zone_final/screens/single_product_two.dart';

import '../colors.dart';
import '../data/all_products_data.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height* 0.07,
                decoration: BoxDecoration(
                  color: productElement1,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              const Text('Favourites',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width* 0.15,
                height: MediaQuery.of(context).size.height* 0.07,
                decoration: BoxDecoration(
                  color: productElement1,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text('Clear favourites',style: TextStyle(
                                color: zoneColor1
                            ) ,),
                            content: const Text('Are you sure you want to remove all elements'),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: const Text('cancel',style: TextStyle(
                                  color: Colors.grey
                              ) ,)
                              ),
                              TextButton(onPressed: (){
                                deleteAllElements(context: context);
                                Navigator.of(context).pop();
                              }, child: const Text('Delete',style: TextStyle(
                                  color: Colors.red
                              ) ,)),
                            ],
                          );
                        });
                      },
                      icon: const Icon(Icons.delete_outline,color: Colors.black,)
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context:context,
              removeTop: true,
              child: ListView.builder(
                itemCount: favourites.length + 1,
                itemBuilder: (context, index){
                  if(index == favourites.length ){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*0.15,
                    );
                  }
                  return FavouritesElement(index:index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteAllElements({required BuildContext context}) {
    setState(() {
      favourites.clear();
    });
    Fluttertoast.showToast(
        msg: 'Favourites list cleared successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

class FavouritesElement extends StatefulWidget {
  final int index;
  const FavouritesElement({Key? key,required this.index}) : super(key: key);

  @override
  State<FavouritesElement> createState() => _FavouritesElementState();
}

class _FavouritesElementState extends State<FavouritesElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.18,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: zoneColor1.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0,3)
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox( width: 10,),
          Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: productElement2.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height*0.05
                    )
                ),
                child: Image.asset(favourites[widget.index]['image'],fit: BoxFit.fill,),
              )
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(favourites[widget.index]['name'],style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                        Text('${favourites[widget.index]['price']} LE',
                          style: const TextStyle(
                              color:Colors.grey,
                              fontSize: 14
                          ),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '${(favourites[widget.index]['description'])}',
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 16
                        ),),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Text('preview details',style: TextStyle(
                              fontSize: 12,
                              color: zoneColor1
                          ),),
                          const SizedBox( width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, PageTransition(
                                child:(favourites[widget.index]['type']==1)?
                                SingleProductOne(product: favourites[widget.index]):
                                SingleProductTwo(product: favourites[widget.index]),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                              ));
                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: zoneColor1,
                              child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 10,),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: IconButton(
                onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Remove from favourites',style: TextStyle(
                          color: zoneColor1
                      ) ,),
                      content: const Text('Are you sure you want to remove element'),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: const Text('cancel',style: TextStyle(
                            color: Colors.grey
                        ) ,)
                        ),
                        TextButton(onPressed: (){
                          deleteElement(context: context,index: widget.index);
                          Navigator.of(context).pop();
                        }, child: const Text('Delete',style: TextStyle(
                            color: Colors.red
                        ) ,)),
                      ],
                    );
                  });
                },
                icon: const Icon(Icons.delete_forever,color: Colors.red,),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteElement({required context,required int index}) {
    favourites.removeAt(index);
    Fluttertoast.showToast(
        msg: 'Element deleted successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}