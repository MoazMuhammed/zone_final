import 'package:flutter/material.dart';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/screens/single_product_one/sliver_app_bar.dart';
import '../colors.dart';

class SingleProductOne extends StatefulWidget {
  final Map<String, dynamic> product;
  const SingleProductOne({Key? key, required this.product}) : super(key: key);

  @override
  State<SingleProductOne> createState() => _SingleProductOneState();
}

class _SingleProductOneState extends State<SingleProductOne> {
  int chosenSizeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
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
          Expanded(
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                  height: MediaQuery.of(context).size.height* 0.07,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Center(
                    child: Text( 'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      )
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          getSliverAppBar(context: context, product: widget.product),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                switch (index) {
                  case 0:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          widget.product['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ),
                    );
                  case 1:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '${widget.product['price']} LE',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    );
                  case 2:
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        children: const [
                          Text(
                            'Description',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  case 3:
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${widget.product['description']}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 16),
                      ),
                    );
                  case 4:
                    return Padding(
                      padding: const EdgeInsets.only(top: 40,left: 20,bottom: 15),
                      child: Row(
                        children: const [
                          Text(
                            'Size',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  default:
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: allSizes.length,
                            itemBuilder: (context,index){
                              return singleSizeElement(index);
                        }),
                      )
                    );
                }
              },
              childCount: 6,
            ),
          )
        ],
      ),
    );
  }

  Widget singleSizeElement(int index) {
    return GestureDetector(
      onTap: (availableSizes.contains(allSizes[index]))?(){
        setState(() {
          chosenSizeIndex = index;
        });
      }:(){},
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: MediaQuery.of(context).size.width* 0.2,
            decoration: BoxDecoration(
              color: (index == chosenSizeIndex)?Colors.black:productElement2.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              ),
            child: Center(
              child: Text('${allSizes[index]}',
                    style: TextStyle(
                      fontSize: 18,
                      color: (index != chosenSizeIndex)?Colors.black:Colors.white,
                    ),
              ),
            ),
          ),
          Visibility(
            visible: !availableSizes.contains(allSizes[index]),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: MediaQuery.of(context).size.width* 0.2,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
