import 'package:flutter/material.dart';

class RateBar extends StatefulWidget {
  const RateBar({Key? key}) : super(key: key);

  @override
  State<RateBar> createState() => _RateBarState();
}

class _RateBarState extends State<RateBar> {
  int chosenIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getStars(),
      ),
    );
  }

  List<Widget> getStars(){
    List<Widget> stars = [];
    for(int i = 0;i<5;i++){
      stars.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      chosenIndex = i;
                    });
                  },
                  child: Icon(
                    (chosenIndex >= i)?Icons.star:Icons.star_border,
                    color: Colors.yellow,
                    size: 40,
                  ),
                ),
              ),
              (i == 0)? const Text('poor',style: TextStyle(color: Colors.black54,fontSize: 12),) :
              (i == 4)?const Text('Excellent',style: TextStyle(color: Colors.black54,fontSize: 12),):
              const Text(''),
            ],
          )
      );
    }
    return stars;
  }


}