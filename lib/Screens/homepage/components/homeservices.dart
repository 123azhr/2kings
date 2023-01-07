import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/components/workers/workers_list.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../models/service_model.dart';
import '../../../providers/contractor_provider.dart';
import '../../../providers/service_provider.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final serviceList = serviceProvider.getList;

    final currentProvider = Provider.of<ContractorsProvider>(context);
    final loggedInUser = currentProvider
        .getUserByID(FirebaseAuth.instance.currentUser!.uid.trim());
    List<ServiceModel> tempList = List<ServiceModel>.generate(
      0,
      (index) => serviceList.first,
    );

    List<ServiceModel> _allHomeService() {
      for (int i = 0; i < serviceList.length; i++) {
        if (serviceList[i].serviceCategroy == true &&
            loggedInUser.services!.contains(serviceList[i].serviceName)) {
          tempList.add(serviceList[i]);
        }
      }
      return tempList;
    }

    return SizedBox(
      height: setHeight(60),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: getProportionateScreenWidth(0),
            mainAxisSpacing: getProportionateScreenHeight(0),
            mainAxisExtent: getProportionateScreenHeight(130),
          ),
          shrinkWrap: true,
          itemCount: _allHomeService().length,
          itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                value: _allHomeService()[index],
                child: const WorkerSlide(),
              )),
    );
  }
}

class WorkerSlide extends StatelessWidget {
  const WorkerSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceModel = Provider.of<ServiceModel>(context);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.center,
            child: WorkersList(serviceName: serviceModel.serviceName!),
            duration: const Duration(milliseconds: 550),
            inheritTheme: true,
            ctx: context),
      ),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(70),
              child: Image(
                image:
                    CachedNetworkImageProvider(serviceModel.serviceimageURL!),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
              child: Center(
                child: Text(
                  serviceModel.serviceName!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: getProportionateScreenHeight(17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
