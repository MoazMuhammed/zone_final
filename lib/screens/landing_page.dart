import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone_final/blocs/active_user/active_user_bloc.dart';
import 'package:zone_final/blocs/landing_page/landing_page_bloc.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/screens/current_orders.dart';
import 'package:zone_final/screens/home.dart';
import 'package:zone_final/screens/login_register.dart';
import 'package:zone_final/screens/notifications.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:zone_final/screens/profile.dart';
import 'no_internet_page.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool hasConnection = true;

  void findConnection(){
    checkInternet();
  }

  Future<void> checkInternet() async {
    hasConnection = await InternetConnectionChecker().hasConnection;
    InternetConnectionChecker().onStatusChange.listen(
          (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            setState(() {
              hasConnection = true;
            });
            break;
          case InternetConnectionStatus.disconnected:
            setState(() {
              hasConnection = false;
            });
            break;
        }
      },
    );

  }

  Future<void> getSavedToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    savedToken =  sharedPreferences.getString('token')??'';
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findConnection();
    getSavedToken().then((value){
      BlocProvider.of<ActiveUserBloc>(context).add(ActiveUserChangedEvent(token: savedToken));
    });
  }

  @override
  Widget build(BuildContext context) {
    return (!hasConnection)? NoInternetPage(function: checkInternet )
        :BlocBuilder<LandingPageBloc, LandingPageState>(
      builder: (context, state) {
        if(state is LandingPageChanged){
          return Scaffold(
            bottomNavigationBar: ResponsiveNavigationBar(
              navigationBarButtons: [
                NavigationBarButton(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    text: 'Home',
                    icon: Icons.home,
                    backgroundColor: zoneColor1,
                ),
                NavigationBarButton(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    text: 'current orders',
                    icon: Icons.list_alt,
                    backgroundColor: zoneColor1
                ),
                NavigationBarButton(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    text: 'notifications',
                    icon: Icons.notifications,
                    backgroundColor: zoneColor1
                ),
                NavigationBarButton(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    text: (BlocProvider.of<ActiveUserBloc>(context).token == '')?'login':'profile',
                    icon: (BlocProvider.of<ActiveUserBloc>(context).token == '')?Icons.login:Icons.person,
                    backgroundColor: zoneColor1
                ),
              ],
              borderRadius: 25,
              selectedIndex: state.pageIndex,
              backgroundOpacity: 0.6,
              onTabChange: (index) {
                BlocProvider.of<LandingPageBloc>(context).add(LandingPageIndexChangedEvent(newIndex: index));
              },
              fontSize: 16,
              textStyle: const TextStyle(
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              outerPadding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10),
            ),
            extendBody: true,
            body: SafeArea(
              bottom: false,
              top: false,
              child: getBody(state.pageIndex),
            ),
          );
        }else{
          return const SizedBox();
        }

      },
    );
  }

  Widget getBody(int index) {
    switch (index) {
      case 1:
        return const CurrentOrders();
      case 2:
        return const NotificationsScreen();
      case 3:
        return (BlocProvider.of<ActiveUserBloc>(context).token == '')?const LoginRegisterScreen():const Profile();
      default:
        return const HomeScreen();
    }
  }
}
