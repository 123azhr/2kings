import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../models/current_user.dart';
import '../../providers/current_user_provider.dart';

class FillAggrement extends StatelessWidget {
  final ScreenshotController screenshotController = ScreenshotController();

  FillAggrement({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentUserProvider currentUserProvider =
        Provider.of<CurrentUserProvider>(context);
    final myServices = currentUserProvider.getCurrentUser().services;

    // final serviceProvider = Provider.of<ServiceProvider>(context);
    // final serviceList = serviceProvider.getList;

    // List<ServiceModel> tempList = List<ServiceModel>.generate(
    //   0,
    //   (index) => serviceList.first,
    // );

    // List<ServiceModel> _allService() {
    //   List<ServiceModel> tempList = List<ServiceModel>.generate(
    //     0,
    //     (index) => serviceList.first,
    //   );
    //   List<String> servicesList = [];
    //   for (int i = 0; i < serviceList.length; i++) {
    //     tempList.add(serviceList[i]);
    //   }
    //   return tempList;
    // }

    // List<ServiceModel> _myServices() {
    //   List<ServiceModel> tempList = List<ServiceModel>.generate(
    //     0,
    //     (index) => serviceList.first,
    //   );
    //   List<String> servicesList = [];
    //   for (int i = 0; i < serviceList.length; i++) {
    //     tempList.add(serviceList[i]);
    //   }
    //   return tempList;
    // }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
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
                child: Screenshot(
                  controller: screenshotController,
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              thickness: 0.4,
                            ),
                            const Center(
                              child: Text(
                                "Customer details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: const [
                                Text(
                                  "Name: Areeb uz Zaman",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  "ID: HSGduidiusa894asddad45",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              "CNIC: 412856448156",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            const Divider(thickness: 0.4),
                            const Center(
                              child: Text(
                                "Contractor details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Row(
                              children: const [
                                Text(
                                  "Name: Arsalan Ahmed",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  "ID: HSGd4d5s6f46ds5f5",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                            const Text(
                              "CNIC: 894684867",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            const Divider(thickness: 0.4),
                            Row(
                              children: const [
                                Text(
                                  "Start Date: 9/8/2022",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  "End Date: 9/9/2022",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                            const Divider(thickness: 0.4),
                            Center(
                              child: const Text(
                                "Services",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            const Divider(thickness: 0.4),
                            SizedBox(
                                child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: myServices!.length,
                              itemBuilder: (context, int index) =>
                                  ServiceSlide(serviceName: myServices[index]),
                            )),
                            const Divider(thickness: 0.4),
                            const SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Aggrement details",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                    getProportionateScreenWidth(10)),
                                isCollapsed: true,
                                hintText: "Type here..",
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            )));
  }
}

class ServiceSlide extends StatefulWidget {
  const ServiceSlide({
    Key? key,
    required this.serviceName,
  }) : super(key: key);
  final String serviceName;
  @override
  State<ServiceSlide> createState() => _ServiceSlideState();
}

class _ServiceSlideState extends State<ServiceSlide> {
  bool? isCheck = false;
  bool? isCheck1 = true;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<CurrentUserProvider>(context);
    CurrentUserModel user = userProvider.getCurrentUser();
    bool? initialValue = false;

    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(10),
                left: getProportionateScreenHeight(10)),
            child: Text(
              widget.serviceName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: getProportionateScreenHeight(17),
              ),
            ),
          ),
          const Spacer(),
          Checkbox(
            value: initialValue ? isCheck1 : isCheck,
            onChanged: (value) {
              setState(() {
                isCheck = value!;
                isCheck1 = value;
                if (list.contains(widget.serviceName) == false &&
                    value == true) {
                  list.add(widget.serviceName);
                } else if (list.contains(widget.serviceName) == true &&
                    value == false) {
                  list.remove(widget.serviceName);
                }
              });
            },
          )
        ],
      ),
    );
  }
}

List<String> list = [];
