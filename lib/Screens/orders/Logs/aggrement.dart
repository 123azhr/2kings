import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class ViewAggrement extends StatelessWidget {
  const ViewAggrement({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Aggrement",
            style: TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox(
          height: setHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 0.4,
                    ),
                    Center(
                      child: Text(
                        "Customer details",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Name: Areeb uz Zaman",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "ID: HSGduidiusa894asddad45",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      "CNIC: 412856448156",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Divider(thickness: 0.4),
                    Center(
                      child: Text(
                        "Contractor details",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Name: Arsalan Ahmed",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "ID: HSGd4d5s6f46ds5f5",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      "CNIC: 894684867",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Divider(thickness: 0.4),
                    Row(
                      children: [
                        Text(
                          "Start Date: 9/8/2022",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "End Date: 9/9/2022",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(thickness: 0.4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("service name"),
                        Text("service Price"),
                        Text("service days"),
                      ],
                    ),
                    Divider(thickness: 0.4),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 50,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("name "),
                          Text("S4865 "),
                          Text("20 "),
                        ],
                      ),
                    ),
                    Divider(thickness: 0.4),
                    Center(
                      child: Text(
                        "Aggrement details",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        isCollapsed: true,
                        hintText: "Type here..",
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
// Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: setHeight(100),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Divider(
//                 thickness: 0.4,
//               ),
//               Center(
//                 child: Text(
//                   "Customer details",
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Text(
//                     "Name: Areeb uz Zaman",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   Spacer(),
//                   Text(
//                     "ID: HSGduidiusa894asddad45",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ],
//               ),
//               Text(
//                 "CNIC: 412856448156",
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//               ),
//               Divider(thickness: 0.4),
//               Center(
//                 child: Text(
//                   "Contractor details",
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Text(
//                     "Name: Arsalan Ahmed",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   Spacer(),
//                   Text(
//                     "ID: HSGd4d5s6f46ds5f5",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ],
//               ),
//               Text(
//                 "CNIC: 894684867",
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//               ),
//               Divider(thickness: 0.4),
//               Row(
//                 children: [
//                   Text(
//                     "Start Date: 9/8/2022",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                   Spacer(),
//                   Text(
//                     "End Date: 9/9/2022",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ],
//               ),
//               Divider(thickness: 0.4),
//               ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) =>
//                     Text("service name: service price"),
//               )
//             ]),
//           ),
//         ),