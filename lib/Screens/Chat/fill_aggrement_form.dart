import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/models/user_model.dart';
import 'package:housecontractors/providers/aggrement_provider.dart';
import 'package:housecontractors/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../models/current_user.dart';
import '../../providers/current_user_provider.dart';
import '../../providers/message_provider.dart';

class FillAggrement extends StatefulWidget {
  const FillAggrement({super.key, required this.customerID});

  final String customerID;

  @override
  State<FillAggrement> createState() => _FillAggrementState();
}

class _FillAggrementState extends State<FillAggrement> {
  final ScreenshotController screenshotController = ScreenshotController();

  String startDate = "";
  String endDate = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    final messageProvider = Provider.of<MessageProvider>(context);

    CurrentUserProvider currentUserProvider =
        Provider.of<CurrentUserProvider>(context);
    CurrentUserModel contractorModel = currentUserProvider.getCurrentUser();
    List<dynamic>? myServices = contractorModel.services;
    AggrementProvider aggrementProvider =
        Provider.of<AggrementProvider>(context);

    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserModel customerModel = userProvider.getUserByID(widget.customerID);
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
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            softWrap: true,
                            "Name: " + customerModel.name!,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            softWrap: true,
                            "ID: " + customerModel.userID!,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        softWrap: true,
                        "CNIC: " + customerModel.cnic!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const Divider(thickness: 0.4),
                      const Center(
                        child: Text(
                          "Contractor details",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Row(
                        children: [
                          Text(
                            softWrap: true,
                            "Name: " + contractorModel.name!,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Spacer(),
                          Text(
                            softWrap: true,
                            "ID: " + contractorModel.userID!,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        softWrap: true,
                        "CNIC: " + contractorModel.cnic!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const Divider(thickness: 0.4),
                      Row(
                        children: [
                          Text(
                            "Start Date: ",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () async {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2025, 6, 7),
                                    onConfirm: (date) {
                                  setState(() {
                                    startDate = date.day.toString() +
                                        "/" +
                                        date.month.toString() +
                                        "/" +
                                        date.year.toString();
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: Text(
                                startDate == "" ? 'Select' : startDate,
                                style: TextStyle(color: Colors.blue),
                              )),
                          const Spacer(),
                          Text(
                            "End Date: ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () async {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime(2025, 6, 7),
                                    onConfirm: (date) {
                                  setState(() {
                                    endDate = date.day.toString() +
                                        "/" +
                                        date.month.toString() +
                                        "/" +
                                        date.year.toString();
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: Text(
                                endDate == "" ? 'Select' : endDate,
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                      ),
                      const Divider(thickness: 0.4),
                      Center(
                        child: const Text(
                          "Services",
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
                            style: TextStyle(color: Colors.black, fontSize: 16),
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
                        controller: _textController,
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
      ),
      bottomSheet: SizedBox(
          height: setHeight(10),
          width: setWidth(100),
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                String aggrementID =
                    await aggrementProvider.uploadAggrementDataToFireStore(
                        customerID: widget.customerID,
                        contractorID:
                            currentUserProvider.getCurrentUser().userID,
                        details: _textController.text,
                        status: false);
                _textController.clear();
                aggrementProvider.fetch();
                messageProvider.uploadMessageDataToFireStore(
                    chatWith: widget.customerID,
                    createdAt: DateTime.now(),
                    messagetxt: _textController.text,
                    aggrementID: aggrementID,
                    type: true);
                _textController.clear();
                messageProvider.fetch();
              },
              child: const Text("Send"),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 0,
                ),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          )),
    ));
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
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<CurrentUserProvider>(context);
    CurrentUserModel user = userProvider.getCurrentUser();

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
            value: isCheck,
            onChanged: (value) {
              setState(() {
                isCheck = value!;
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
