import 'package:admin_beauty_app/Core/constants.dart';
import 'package:admin_beauty_app/View/Pages/Details%20Screen/details_screen.dart';
import 'package:admin_beauty_app/View/Reusable%20Components/reusable_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Order Tracking Screen/order_tracking_screen.dart';

class OrdersListScreen extends StatelessWidget {
  OrdersListScreen(
      {super.key,
      required this.appbarTitle,
      required this.category,
      required this.subCategory});
  final String appbarTitle;
  final String category;
  final String subCategory;
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('Orders List');
  @override
  Widget build(BuildContext context) {
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back),
          ),
          title: ReusableText(
              weight: FontWeight.w700,
              fontSize: width * 0.045,
              lbl: appbarTitle),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: databaseRef
                .orderByChild('status')
                .equalTo(appbarTitle == 'New Orders'
                    ? 'pending'
                    : appbarTitle == 'Active Orders'
                        ? 'active'
                        : appbarTitle == 'Cancelled Orders'
                            ? 'cancel'
                            : 'completed')
                .onValue,
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              } else {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data?.snapshot.value != null) {
                  Map<dynamic, dynamic>? data =
                      snap.data?.snapshot.value as Map<dynamic, dynamic>?;
                  List<Map<String, dynamic>> filteredItems = [];

                  data?.forEach((index, data) =>
                      filteredItems.add({"key": index, ...data}));
                  return Container(
                    height: height,
                    width: width,
                    color: themeLightColor,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: filteredItems.length,
                        padding: EdgeInsets.only(bottom: height * 0.015),
                        itemBuilder: (context, index) {
                          return Material(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.015,
                                  left: width * 0.025,
                                  right: width * 0.025),
                              child: ListTile(
                                tileColor: themeColor,
                                leading: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(
                                        weight: FontWeight.w600,
                                        fontSize: width * 0.035,
                                        alignTxt: TextAlign.left,
                                        lbl: filteredItems[index]['category']),
                                    ReusableText(
                                        weight: FontWeight.w500,
                                        fontSize: width * 0.029,
                                        alignTxt: TextAlign.left,
                                        lbl:
                                            '${filteredItems[index]['service']} (£${filteredItems[index]['price']})'),
                                  ],
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    appbarTitle == 'Active Orders'
                                        ? Get.to(const OrderTrackingScreen(),
                                            transition: Transition.fadeIn)
                                        : Get.to(
                                            DetailsScreen(
                                              isNewOrder:
                                                  appbarTitle == 'New Orders'
                                                      ? true
                                                      : false,
                                              name: filteredItems[index]
                                                  ['name'],
                                              category: filteredItems[index]
                                                  ['category'],
                                              service: filteredItems[index]
                                                  ['service'],
                                              time: filteredItems[index]
                                                  ['time'],
                                              date: filteredItems[index]
                                                  ['date'],
                                              phone: filteredItems[index]
                                                  ['phone'],
                                              price: filteredItems[index]
                                                  ['price'],
                                              address: filteredItems[index]
                                                  ['address'],
                                              status: filteredItems[index]
                                                  ['status'],
                                              ind: filteredItems[index]['key'],
                                            ),
                                            transition: Transition.fadeIn);
                                  },
                                  child: Container(
                                    height: height * 0.037,
                                    width: width * 0.172,
                                    margin:
                                        EdgeInsets.only(left: width * 0.075),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              offset: const Offset(1, -1)),
                                        ]),
                                    child: Center(
                                      child: ReusableText(
                                          weight: FontWeight.w600,
                                          fontSize: width * 0.0325,
                                          lbl: 'Details'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Center(
                      child: ReusableText(
                    lbl: 'No data',
                    fontSize: width * 0.04,
                    weight: FontWeight.w700,
                    clr: Colors.black,
                  ));
                }
              }
            }));
  }
}
