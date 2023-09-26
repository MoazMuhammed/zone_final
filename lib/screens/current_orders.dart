import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zone_final/colors.dart';
import 'package:zone_final/data/all_products_data.dart';
import 'package:zone_final/data/orders_handler.dart';
import 'package:zone_final/data/user_handlers.dart';
import '../blocs/landing_page/landing_page_bloc.dart';
import 'current_orders/custom_order_card.dart';

class CurrentOrders extends StatelessWidget {
  const CurrentOrders({Key? key}) : super(key: key);

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
        title: const Text('Current orders',style: TextStyle(
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
      body: FutureBuilder(
        future: getActiveUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data != null){
              return FutureBuilder(
                  future: getCurrentOrdersByClientId(snapshot.data!.id!),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      if(snapshot.data!.isNotEmpty){
                        return ListView.builder(
                            itemCount: orders.length,
                            itemBuilder:(context,index){
                              return CustomOrderCardCurrent(order: orders[index]);
                            });
                      }
                      else{
                        return const Center(
                          child: Text('You have no current orders yet!',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                        );
                      }
                    }
                    else {
                      return CircularProgressIndicator(
                        strokeWidth: 2,
                        color: zoneColor1,
                      );
                    }
                  }
              );
            }
            else{
              return const Center(
                child: Text('You need to log in!',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),
              );
            }
          }
          else {
            return Center(
              child: CircularProgressIndicator(
                color: zoneColor1,
                strokeWidth: 2,
              ),
            );
          }
        }
      ),
    );
  }
}


