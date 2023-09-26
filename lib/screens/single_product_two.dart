import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../colors.dart';

class SingleProductTwo extends StatefulWidget {
  final Map<String,dynamic> product;
  const SingleProductTwo({Key? key,required this.product}) : super(key: key);

  @override
  State<SingleProductTwo> createState() => _SingleProductTwoState();
}

class _SingleProductTwoState extends State<SingleProductTwo> {

  int itemsNum = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height*0.08,
        decoration: BoxDecoration(
          color: zoneColor1,
          borderRadius:  BorderRadius.only(
            bottomRight: Radius.circular(
                MediaQuery.of(context).size.height*0.04
            ),
            topRight: Radius.circular(
                MediaQuery.of(context).size.height*0.04
            )
          )
        ),
        child: Row(
          children: [
            const SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  child: Text(
                    'Proceed to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: Text(
                    '${widget.product['price']*itemsNum} LE',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width*0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.04),
                color: Colors.white
              ),
              child: IconButton(
                onPressed: (){},
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.keyboard_double_arrow_right_sharp,color: Colors.black,),
                    Icon(Icons.keyboard_double_arrow_right_sharp,color: Colors.black,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.07,
                    child: AutoSizeText(
                      widget.product['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.width*0.12,
                        child: Image.asset('images/left_long_arrow.png',fit: BoxFit.fill,),
                      )
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.7,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                        width: MediaQuery.of(context).size.width* 0.15,
                        height: MediaQuery.of(context).size.height* 0.07,
                        decoration: BoxDecoration(
                          color: productElement2.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                              },
                              icon: (widget.product['favourite'])
                                  ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: SizedBox()),
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          decoration: BoxDecoration(
                            color: zoneColor1,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black54,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                              ),
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 34.0),
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          itemsNum++;
                                        });
                                      },
                                      icon: const Icon(Icons.add,color: Colors.white,size: 30),
                                    ),
                                  ),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width*0.2,
                                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 52.0,vertical: 20.0),
                                  child: Text(
                                    '$itemsNum',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width*0.2,
                                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 34.0),
                                  child: IconButton(
                                    onPressed: (){
                                      if(itemsNum == 1){}
                                      else{
                                        setState(() {
                                          itemsNum -- ;
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.minimize,color: Colors.white,size: 30,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                          flex: 2,
                          child: SizedBox()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width*0.68,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              zoneColor2,
                              Colors.white,
                            ],
                            center: Alignment.centerLeft,
                            focal: Alignment.centerRight,
                            focalRadius: 4
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                MediaQuery.of(context).size.height*0.35
                            ),
                            topLeft: Radius.circular(
                                MediaQuery.of(context).size.height*0.35
                            )
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: MediaQuery.of(context).size.height * 0.2,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      spreadRadius: -38,
                                      blurRadius: 10,
                                      offset: Offset(0, 48)),
                                ]),
                                child: Image.asset(
                                  widget.product['image'],
                                  fit: BoxFit.fitHeight,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.product['description'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),
          ],
        ),
      ),

    );
  }
}
