import 'package:flutter/material.dart';
import 'package:housecontractors/components/workers/workers_list.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../models/service_model.dart';
import '../../../providers/service_provider.dart';

class ConstructionServices extends StatelessWidget {
  const ConstructionServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final serviceList = serviceProvider.getList;
    List<ServiceModel> tempList = List<ServiceModel>.generate(
      0,
      (index) => serviceList.first,
    );

    List<ServiceModel> _allHomeService() {
      for (int i = 0; i < serviceList.length; i++) {
        if (serviceList[i].serviceCategroy == false) {
          tempList.add(serviceList[i]);
        }
      }
      return tempList;
    }

    List<ServiceModel> _allService(String serviceName) {
      List<ServiceModel> tempList = List<ServiceModel>.generate(
        0,
        (index) => serviceList.first,
      );

      for (int i = 0; i < serviceList.length; i++) {
        if (serviceList[i].serviceCategroy == false &&
            serviceList[i].serviceName == serviceName) {
          tempList.add(serviceList[i]);
        }
      }
      return tempList;
    }

    return SizedBox(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: getProportionateScreenWidth(0),
            mainAxisSpacing: getProportionateScreenHeight(0),
            mainAxisExtent: getProportionateScreenHeight(120),
          ),
          shrinkWrap: true,
          itemCount: _allHomeService().length,
          itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                value: _allHomeService()[index],
                child: WorkerSlide(),
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(70),
              child: Image(
                image: NetworkImage(serviceModel.serviceimageURL!),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
              child: Text(
                serviceModel.serviceName!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
