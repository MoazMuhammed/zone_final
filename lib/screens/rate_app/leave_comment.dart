import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone_final/colors.dart';

class LeaveComment extends StatefulWidget {
  const LeaveComment({Key? key}) : super(key: key);

  @override
  State<LeaveComment> createState() => _LeaveCommentState();
}

class _LeaveCommentState extends State<LeaveComment> {
  bool isChanged = false;

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Leave Comment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Your feedback is important. Let us know your thoughts, suggestions or if you have spotted an issue or a bug',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
            child: TextField(
              controller: commentController,
              onChanged: (val){
                setState(() {
                  if(val.isEmpty){
                    isChanged = false;
                  }else{
                    isChanged = true;
                  }
                });
              },
              cursorColor: zoneColor1,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: zoneColor1),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (isChanged)?(){
                commentController.clear();
                setState(() {
                  isChanged = false;
                });
                Fluttertoast.showToast(
                  msg: 'Feedback sent successfully',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }:(){},
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.07,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: (isChanged)?zoneColor1:Colors.grey
              ),
              child: const Center(
                child: Text('Send feedback',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
