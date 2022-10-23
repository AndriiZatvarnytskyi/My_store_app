// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:my_app/core/view_model/checkout_view_model.dart';
// import 'package:my_app/view/cart_view.dart';
// import 'package:my_app/view/bye_stepper/widgets/add_address_widget.dart';
// import 'package:my_app/view/bye_stepper/widgets/delevery_time_widget.dart';
// import 'package:my_app/view/bye_stepper/widgets/summary_widget.dart';
// import 'package:my_app/view/home_view.dart';
// import 'package:status_change/status_change.dart';

// import '../../constance.dart';

// class HorizontalExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CheckOutViewModel>(
//       init: CheckOutViewModel(),
//       builder: (controller) => Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0.0,
//           title: Text(
//             "Order Status",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 child: StatusChange.tileBuilder(
//                   theme: StatusChangeThemeData(
//                     direction: Axis.horizontal,
//                     connectorTheme:
//                         ConnectorThemeData(space: 1.0, thickness: 1.0),
//                   ),
//                   builder: StatusChangeTileBuilder.connected(
//                       itemWidth: (_) =>
//                           MediaQuery.of(context).size.width / _processes.length,
//                       contentWidgetBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Text(
//                             'add content here',
//                             style: TextStyle(
//                               color: Colors
//                                   .blue, // change color with dynamic color --> can find it with example section
//                             ),
//                           ),
//                         );
//                       },
//                       nameWidgetBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.all(20.0),
//                           child: Text(
//                             'your text ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green,
//                             ),
//                           ),
//                         );
//                       },
//                       indicatorWidgetBuilder: (_, index) {
//                         if (index <= controller.index) {
//                           return DotIndicator(
//                             size: 35.0,
//                             border: Border.all(color: Colors.green, width: 1.0),
//                             child: Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ),
//                           );
//                         } else {
//                           return OutlinedDotIndicator(
//                             size: 30,
//                             borderWidth: 1.0,
//                             color: Colors.green,
//                           );
//                         }
//                       },
//                       lineWidgetBuilder: (index) {
//                         if (index > 0) {
//                           if (index == controller.index) {
//                             Color? prevColor = controller.getColor(index - 1);
//                             Color? color = controller.getColor(index);
//                             dynamic gradientColors;
//                             gradientColors = [
//                               prevColor,
//                               Color.lerp(prevColor, color, 0.5)
//                             ];
//                             return DecoratedLineConnector(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: gradientColors,
//                                 ),
//                               ),
//                             );
//                           } else {
//                             return SolidLineConnector(
//                               color: controller.getColor(index),
//                             );
//                           }
//                         } else {
//                           return null;
//                         }
//                       },
//                       itemCount: 3
//                       //_processes.length,
//                       ),
//                 ),
//               ),
//             ),
//             controller.pages == Pages.DeliveryTime
//                 ? DeliveryTime()
//                 : controller.pages == Pages.AddAddress
//                     ? AddAddress()
//                     : Summary()
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.skip_next),
//           onPressed: () {
//             controller.changeIndex(controller.index + 1);
//           },
//           backgroundColor: inProgressColor,
//         ),
//       ),
//     );
//   }
// }

// final _processes = [
//   'Order Signed',
//   'Order Processed',
//   'Shipped ',
//   'Out for delivery ',
//   'Delivered ',
// ];

// final _content = [
//   '20/18',
//   '20/18',
//   '20/18',
//   '20/18',
//   '20/18',
// ];

// // class MyWidget extends StatefulWidget {
// //   @override
// //   State<MyWidget> createState() => _MyWidgetState();
// // }

// // class _MyWidgetState extends State<MyWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }
