import 'package:flutter/material.dart';
import 'package:housecontractors/models/post_model.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import '../../../helper/size_configuration.dart';
import '../../../providers/post_provider.dart';
import 'open_comments.dart';

class Comments extends StatelessWidget {
  const Comments({
    required this.postModel,
    required this.postProvider,
    Key? key,
  }) : super(key: key);

  final PostModel postModel;
  final PostProvider postProvider;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => MyContainer(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            color: const Color.fromARGB(255, 255, 230, 149),
            width: setWidth(100),
            height: setHeight(60),
            child: OpenComments()),
      ),
      child: Container(
        color: Colors.transparent,
        height: setHeight(5),
        width: setWidth(48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.comment),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            const Text("Comments"),
          ],
        ),
      ),
    );
  }
}
