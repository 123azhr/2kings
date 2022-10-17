import 'package:flutter/material.dart';
import 'package:housecontractors/components/workers/workers_list.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../models/service_model.dart';
import '../../../providers/service_provider.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final serviceList = serviceProvider.getList;
    List<ServiceModel> tempList = List<ServiceModel>.generate(
      serviceList.length,
      (index) => serviceList.first,
    );

    _final() {
      tempList.add(serviceList[0]);
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
          itemCount: serviceList.length,
          itemBuilder: (context, int index) {
            if (serviceList[index].serviceCategroy == false) {
              return ChangeNotifierProvider.value(
                value: serviceList[index],
                child: WorkerSlide(
                  assetImagePath: "",
                  title: "",
                ),
              );
            } else {
              return Text(tempList.toString());
            }
          }),
    );
  }
}

//  ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: postsList.length,
//         itemBuilder: (context, int index) => ChangeNotifierProvider.value(
//           value: postsList[index],
//           child: Post(title: ""),
//         ),
//         physics: const BouncingScrollPhysics(),
//       ),
class WorkerSlide extends StatelessWidget {
  final String assetImagePath, title;
  const WorkerSlide({
    Key? key,
    required this.title,
    required this.assetImagePath,
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
            child: WorkersList(
                workerName: "Arsalan", serviceName: serviceModel.serviceName!),
            duration: Duration(milliseconds: 550),
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
