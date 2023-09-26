import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import '../data/all_products_data.dart';

class LocalizedChoice extends StatefulWidget {
  final String type;


  const LocalizedChoice({Key? key ,required this.type}) : super(key: key);

  @override
  State<LocalizedChoice> createState() => _LocalizedChoiceState();
}

class _LocalizedChoiceState extends State<LocalizedChoice> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    List <String> data = (widget.type == 'l')? languages:countries;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text((widget.type == 'l')?'Language':'Country',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back,color: Colors.black,)
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.12,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return ListTile(
                          selectedColor: zoneColor1,
                          selected: chosenIndex == index,
                          onTap: (){
                            setState(() {
                              chosenIndex = index;
                            });
                          },
                          title: Text(data[index]),
                          trailing: (chosenIndex == index)? Icon(Icons.check,color: zoneColor1,) :const SizedBox(),
                        );
                      },
                      separatorBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                          child: Divider(
                            height: 2,
                            color: productElement2,
                          ),
                        );
                      },
                      itemCount: data.length
                  ),
                ),
              ),
            ),
            ],
        ),
    );
  }
}
