import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/components/story/story_view.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../../models/story_model.dart';
import '../../../../providers/story_provider.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storyProvider = Provider.of<StoryProvider>(context);
    final storyList = storyProvider.getList;
    return SizedBox(
        height: getProportionateScreenHeight(140),
        width: setWidth(100),
        child: Stack(
          children: [
            SizedBox(
              width: setWidth(100),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: setWidth(22)),
                  itemExtent: setWidth(22),
                  itemCount: storyList.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: storyList[index],
                      child: const StoryTile(),
                    );
                  }),
            ),
            MyContainer(
              height: setHeight(18),
              width: setWidth(20),
              child: InkWell(
                onTap: () {},
                child: const Icon(Icons.add_circle),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ));
  }
}

class StoryTile extends StatelessWidget {
  const StoryTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storyModel = Provider.of<StoryModel>(context);
    return MyContainer(
      height: setHeight(18),
      width: setWidth(20),
      image: NetworkImage(storyModel.url!),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () => Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.bottomToTop,
            child: StoryView(url: storyModel.url!),
            isIos: true,
            duration: const Duration(milliseconds: 400),
          ),
        ),
        child: Image.network(storyModel.url!),
      ),
    );
  }
}
