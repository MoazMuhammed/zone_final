import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zone_final/blocs/landing_page/landing_page_bloc.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/screens/adresses.dart';
import 'package:zone_final/screens/favourites.dart';
import 'package:zone_final/screens/past_orders.dart';
import 'package:zone_final/screens/settings.dart';
import 'package:zone_final/screens/vouchers.dart';
import 'offers.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
        leading: BlocBuilder<LandingPageBloc, LandingPageState>(
          builder: (context, state) {
            if (state is LandingPageChanged) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<LandingPageBloc>(context)
                      .add(LandingPageIndexChangedEvent(newIndex: 0));
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'images/profile_image.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.37,
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                  ),
                  gradient: RadialGradient(
                      colors: [
                        Colors.white,
                        Colors.grey,
                        Colors.white,
                      ],
                      center: Alignment.topLeft,
                      focal: Alignment.center,
                      focalRadius: 4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Amr Kamel',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0),
                      ),
                    ),
                    const Text(
                      'Badr city',
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 0.1,
                                offset: Offset(0, 7)),
                          ]),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:  [
                                getProfileElement(
                                    context: context,
                                    targetedWidget: const Favourites(),
                                    icon: Icons.favorite_outline,
                                    title: 'favourites'
                                ),
                                 getProfileElement(
                                    context: context,
                                    targetedWidget: const Offers(),
                                    icon: Icons.local_offer,
                                    title: 'offers'
                                ),
                                getProfileElement(
                                    context: context,
                                    targetedWidget: const Vouchers(),
                                    icon: Icons.card_giftcard,
                                    title: 'vouchers'
                                ),

                              ],
                            ),
                          ),
                          Container(
                            color: productElement1,
                            width: double.infinity,
                            height: 2,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getProfileElement(
                                    context: context,
                                    targetedWidget: const Addresses(),
                                    icon: Icons.location_on,
                                    title: 'addresses'),
                                getProfileElement(
                                    context: context,
                                    targetedWidget: const PastOrders(),
                                    icon: Icons.checklist_rtl,
                                    title: 'past orders'),
                                getProfileElement(
                                    context: context,
                                    targetedWidget: const Settings(),
                                    icon: Icons.settings,
                                    title: 'settings'
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

}

Widget getProfileElement({required BuildContext context,required IconData icon,required String title,required Widget targetedWidget}){
  return GestureDetector(
    onTap: () {
      Navigator.push(context, PageTransition(
        child: targetedWidget,
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 500),
      ));
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, color: zoneColor1),
        ),
        Text(
          title,
          style: TextStyle(color: zoneColor1, fontSize: 12),
        )
      ],
    ),
  );
}



