import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/menu/aboutus/aboutus.dart';
import 'package:housecontractors/Screens/profile/edit_profile.dart';
import 'package:housecontractors/Screens/profile/edit_services.dart';
import 'package:housecontractors/providers/message_provider.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../providers/chat_provider.dart';
import '../../providers/inventory_provider.dart';
import '../../providers/order_provider.dart';
import '../../providers/contractor_provider.dart';
import '../../providers/service_log_provider.dart';
import '../../providers/worker_provider.dart';
import '../profile/my_profile_view.dart';
import 'logout.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final orderstProvider = Provider.of<OrdersProvider>(context);
    final messageProvider = Provider.of<MessageProvider>(context);
    final workerProvider = Provider.of<WorkerProvider>(context);
    final slog = Provider.of<ServiceLogsProvider>(context);

    final ilog = Provider.of<InventoryProvider>(context);
    final currentProvider = Provider.of<ContractorsProvider>(context);
    final loggedInUser = currentProvider.getUserByID(currentUserID);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenWidth(40),
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.contain,
        ),
        title: Text(
          "Menu",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          InkWell(
            child: ListTile(
              visualDensity: const VisualDensity(vertical: 4),
              dense: true,
              leading: CircleAvatar(
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: loggedInUser.profileImageURL!,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              title: Text(
                loggedInUser.name!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: const Text("View profile"),
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyProfileView(
                          title: loggedInUser.name!,
                        ))),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 4),
            dense: true,
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfilePage(),
              ),
            ),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 4),
            dense: true,
            leading: const CircleAvatar(
              child: Icon(Icons.construction),
            ),
            title: const Text(
              "Edit Services",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditServices(),
                  ));
            },
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: 4),
            dense: true,
            leading: const CircleAvatar(
              child: Icon(Icons.construction),
            ),
            title: const Text(
              "About us",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ));
            },
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
          Logout(
              chatProvider: chatProvider,
              messageProvider: messageProvider,
              orderstProvider: orderstProvider,
              workerProvider: workerProvider,
              slog: slog,
              ilog: ilog),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
        ],
      ),
    );
  }
}
