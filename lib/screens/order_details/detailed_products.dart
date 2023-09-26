import 'package:flutter/material.dart';
import 'package:zone_final/data/all_products_data.dart';

class DetailedProducts extends StatelessWidget {
  const DetailedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Products',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text('name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text('unit price',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
          ),
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text('amount',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('price',
              style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
          ),
        ],
      ),
    ];
    columnChildren.addAll(cartItems.map((e) => Item(item:e)));
    columnChildren.add(const SizedBox(
      height: 15,
    ));

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnChildren,
        ),
      ),

    );
  }
}

class Item extends StatelessWidget {
  final Map<String,dynamic> item;
  const Item({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:  const EdgeInsets.only(left: 20.0),
          child: Text('${item['name']}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),),
        ),
        Padding(
          padding:  const EdgeInsets.only(left: 30.0),
          child: Text('${item['price']}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),),
        ),
        Padding(
          padding:  const EdgeInsets.only(left: 60.0),
          child: Text('${item['amount']}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),),
        ),
        Padding(
          padding:  const EdgeInsets.only(left: 60.0,bottom: 10),
          child: Text('${item['amount']*item['price']}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
        ),
      ],
    );
  }
}

