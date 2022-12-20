// import 'package:flutter/material.dart';
// import 'package:housecontractors/Screens/Chat/chat_inbox.dart';
// import 'package:housecontractors/models/contractor_model.dart';
// import 'package:provider/provider.dart';
// import '../helper/size_configuration.dart';
// import '../providers/chat_provider.dart';

// class BottomCallChat extends StatelessWidget {
//   const BottomCallChat({
//     Key? key,
//     this.user,
//   }) : super(key: key);
//   final ContractorsModel? user;

//   @override
//   Widget build(BuildContext context) {
//     final chatProvider = Provider.of<ChatProvider>(context);
//     final chatList = chatProvider.getList;
//     return BottomAppBar(
//       child: Row(
//         children: [
//           Container(
//             height: 50,
//             width: getProportionateScreenWidth(375 / 2),
//             color: Colors.amber,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.call),
//                 Text("Call"),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) {
//                 if (chatList
//                     .every((element) => element.otherID != user!.userID)) {
//                   chatProvider.createNewChat(otherID: user!.userID);
//                   return Inbox(user: user!);
//                 } else {
//                   return Inbox(user: user!);
//                 }
//               }),
//             ),
//             child: Container(
//               height: 50,
//               width: getProportionateScreenWidth(375 / 2),
//               color: const Color.fromARGB(255, 172, 255, 7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(Icons.chat),
//                   Text("Chat"),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
