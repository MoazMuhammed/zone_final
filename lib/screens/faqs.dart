import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zone_final/colors.dart';

import '../data/all_products_data.dart';

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('FAQs',
          style: TextStyle(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                    itemCount: faqs.length,
                    itemBuilder: (context,index)=> FAQElement(element: faqs[index],),
                    separatorBuilder: (BuildContext context, int index)=> const SizedBox(height: 10,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQElement extends StatefulWidget {
  final Map<String,String> element;
  const FAQElement({Key? key,required this.element}) : super(key: key);

  @override
  State<FAQElement> createState() => _FAQElementState();
}

class _FAQElementState extends State<FAQElement> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: productElement1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: AutoSizeText('${widget.element['title']}',
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      isOpened = !isOpened;
                    });
                  },
                  icon: Icon(
                      (isOpened)?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down,
                    color: zoneColor1,
                  )
              )
            ],
          ),
        ),
        Visibility(
            visible: isOpened,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: productElement2.withOpacity(0.4),
                      width: 2
                  ),
                  right: BorderSide(
                      color: productElement2.withOpacity(0.4),
                      width: 2
                  ),
                  left: BorderSide(
                      color: productElement2.withOpacity(0.4),
                      width: 2
                  ),
                ),
              ),
              child: Text(
                '${widget.element['details']}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  letterSpacing: 1,
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
        )
      ],
    );
  }
}

