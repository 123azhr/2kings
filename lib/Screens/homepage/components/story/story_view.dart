import 'package:flutter/material.dart';
import '../../../../helper/size_configuration.dart';

class StoryView extends StatefulWidget {
  final String? itemURL;
  final String? userImgUrl;
  final String? userName;

  const StoryView({
    super.key,
    required this.itemURL,
    required this.userImgUrl,
    required this.userName,
  });

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          if (controller.value >= 0.999) {
            controller.reset();
          }
        });
      });
    controller.repeat().whenCompleteOrCancel(() {
      Navigator.pop(context);
    });
    Future.delayed(const Duration(seconds: 5)).then((value) async {});

    // controller.repeat().whenCompleteOrCancel(() {

    //   Navigator.pop(context);
    // });
    // controller.repeat(reverse: false);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Center(
              child: Stack(children: [
                SizedBox(
                  width: 10,
                ),
                LinearProgressIndicator(
                  color: Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  value: controller.value,
                ),
                Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        CircleAvatar(
                            foregroundImage: NetworkImage(widget.userImgUrl!)),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Text(
                          widget.userName!,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18),
                        ),
                        const Spacer(),
                        IconButton(
                            icon: const Icon(Icons.close,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            onPressed: () {
                              controller.reset();
                            })
                      ],
                    )),
                Container(child: Center(child: Image.network(widget.itemURL!))),
              ]),
            )));
  }
}
