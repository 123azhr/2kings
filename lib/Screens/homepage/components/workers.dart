import 'package:flutter/material.dart';
import '../widgets/mycontainer.dart';

class Workers extends StatelessWidget {
  const Workers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyContainer(
          height: 150,
          width: 100,
          image: const AssetImage('assets/images/logo-black-half.png'),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text("Electricians"),
          ]),
        ),
        const SizedBox(
          width: 5,
        ),
        MyContainer(
          height: 150,
          width: 100,
          image: const AssetImage('assets/images/logo-black-half.png'),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text("A/C"),
          ]),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
