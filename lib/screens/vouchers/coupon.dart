import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Coupon extends StatelessWidget {
  final Map<String,dynamic> voucher;
  final List<Color> colors;
  const Coupon({Key? key,required this.colors,required this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (voucher['type']==0)?(){
        Clipboard.setData( ClipboardData(text: voucher['code']));
        Fluttertoast.showToast(
            msg: 'Promo Code copied to clipboard',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pop(context);
      }:(){},
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.25,
        margin: const EdgeInsets.all(20),
        child: RotatedBox(
          quarterTurns: 1,
          child: TicketWidget(
            height: MediaQuery.of(context).size.height*0.2,
            width: double.infinity,
            isCornerRounded: true,
            child: RotatedBox(
              quarterTurns: -1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0,top: 25.0),
                          child: Text('- ${voucher['percent']}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('expiration:  ${voucher['expired_at']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom:15.0,left: 25),
                          child: Text('${voucher['code']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0,bottom: 25),
                            child: AutoSizeText('${voucher['details']}',
                              style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
