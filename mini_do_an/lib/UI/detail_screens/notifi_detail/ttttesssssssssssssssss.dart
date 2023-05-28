// SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       width: size.width * .1,
//                       height: 50,
//                       margin: EdgeInsets.only(right: 8, left: 4),
//                       child: CircleAvatar(
//                         backgroundImage:
//                             ExactAssetImage('assets/icons/utc2.png'),
//                         radius: 50,
//                       ),
//                       decoration: BoxDecoration(shape: BoxShape.circle),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 6,
//                     child: Container(
//                       height: 40,
//                       width: size.width * .6 + 20,
//                       padding: EdgeInsets.symmetric(horizontal: 8),
//                       decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(.2),
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: SizedBox(
//                               height: 35,
//                               width: size.width * .4,
//                               child: TextFormField(
//                                   decoration: InputDecoration(
//                                       hintText: 'Tìm kiếm thông tin',
//                                       icon: Icon(Icons.search))),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5),
//                               child: IconButton(
//                                 onPressed: (() {}),
//                                 icon: Icon(
//                                   Icons.mic,
//                                 ),
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       width: size.width * .1,
//                       child: IconButton(
//                         onPressed: (() {}),
//                         icon: Icon(
//                           Icons.notifications_none_outlined,
//                           size: 28,
//                           color: Colors.black.withOpacity(.7),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Carouse_Slider(),
//               Container(
//                   height: size.height * .6,
//                   color: Colors.grey.withOpacity(.2),
//                   padding: EdgeInsets.only(bottom: 30, top: 5),
//                   child: ItemOfNotifi()),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//               // ItemOfNotifi(),
//             ],
//           ),
//         ),
     
    