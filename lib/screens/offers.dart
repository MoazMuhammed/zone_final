import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/data/all_products_data.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Offers',style: TextStyle(
              color: Colors.black
          ),),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,),
          )
      ),
      body: ListView.builder(
          itemCount: ads.length,
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width*0.98,
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(ads[index],fit: BoxFit.cover,)),
              ),
            );          }),
    );
  }
}


