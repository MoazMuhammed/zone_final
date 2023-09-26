import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone_final/colors.dart';

import '../blocs/landing_page/landing_page_bloc.dart';
import '../data/all_products_data.dart';
import 'notifications/custom_notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
          title: const Text('notifications',style: TextStyle(
              color: Colors.black
          ),),
        leading: BlocBuilder<LandingPageBloc, LandingPageState>(
          builder: (context, state) {
            if(state is LandingPageChanged){
              return IconButton(
                icon: const Icon(Icons.arrow_back,color: Colors.black,),
                onPressed: (){
                  BlocProvider.of<LandingPageBloc>(context).add(LandingPageIndexChangedEvent(newIndex: 0));
                },
              );
            }else {
              return const SizedBox();
            }
          },
        ),
      ),
      body: ListView.separated(
          itemCount: notifications.length,
          itemBuilder:(context,index){
            return CustomNotificationCard(notification: notifications[index]);
          },
          separatorBuilder: (context,index){
            return Divider(
              color: zoneColor1,
              height: 1,
            );
          },
      ),
    );
  }
}
