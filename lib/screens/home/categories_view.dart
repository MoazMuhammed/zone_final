import 'package:flutter/material.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/models/categories_models.dart';
import 'package:zone_final/screens/home/element_category.dart';


class CategoriesView extends StatefulWidget {
  final List<ShopCategory> categories;
  const CategoriesView({Key? key,required this.categories}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int? endPage;
  int? index = 0;

  @override
  void initState(){
  if(widget.categories.length%6==0){
  endPage = widget.categories.length~/6;
  }else{
  endPage = widget.categories.length~/6 + 1;
  }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: PageView.builder(
              onPageChanged: (page){
                setState(() {
                  index = page;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: endPage,
              itemBuilder: (context,index){
                int counter =0;
                List<Widget> elementsList =[];
                int start = index*6;
                int end = (index+1)*6;
                List subList = (end>widget.categories.length)?widget.categories.sublist(start):widget.categories.sublist(start,end);
                while(counter<=(subList.length~/2)+2){
                  List<Widget> columnChildren = [];
                  if(counter<subList.length){
                    columnChildren.add(CategoryElement(category: subList[counter]));
                  }
                  if(counter+1 <subList.length){
                    columnChildren.add(CategoryElement(category: subList[counter+1]));
                  }
                  elementsList.add(
                      Column(
                        children: columnChildren,
                      )
                  );
                  counter=counter+2;
                }
                return SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: elementsList,
                  ),
                );
              }
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getDots(endPage!),
        ),
      ],
    );
  }

  List<Widget> getDots(int dotsNum){
    List<Widget> dots = [];
    for(int i = 0;i<dotsNum;i++){
      dots.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: (i == index)?zoneColor1:Colors.grey,
              radius: (i == index)?7.5:5,
            ),
          )
      );
    }
    return dots;
  }

}



