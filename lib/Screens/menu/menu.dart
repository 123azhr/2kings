import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/profile/edit_profile.dart';
import 'package:housecontractors/Screens/profile/edit_services.dart';
import 'package:housecontractors/models/current_user.dart';
import 'package:housecontractors/providers/authentication_provider.dart';
import 'package:housecontractors/providers/message_provider.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../providers/chat_provider.dart';
import '../../providers/current_user_provider.dart';
import '../../providers/order_provider.dart';
import '../../providers/post_provider.dart';
import '../../providers/service_provider.dart';
import '../../providers/story_provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/worker_provider.dart';
import '../profile/my_profile_view.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    final currentProvider = Provider.of<CurrentUserProvider>(context);

    final userProvider = Provider.of<UserProvider>(context);
    final storyProvider = Provider.of<StoryProvider>(context);
    final postProvider = Provider.of<PostProvider>(context);
    final orderstProvider = Provider.of<OrdersProvider>(context);
    final messageProvider = Provider.of<MessageProvider>(context);
    final workerProvider = Provider.of<WorkerProvider>(context);

    final loggedInUser = currentProvider.getCurrentUser();
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          InkWell(
            child: ListTile(
              visualDensity: VisualDensity(vertical: 4),
              dense: true,
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    loggedInUser.profileImageURL!,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              title: Text(
                loggedInUser.name!,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("View profile"),
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
            visualDensity: VisualDensity(vertical: 4),
            dense: true,
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfilePage(),
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
            visualDensity: VisualDensity(vertical: 4),
            dense: true,
            leading: CircleAvatar(
              child: Icon(Icons.construction),
            ),
            title: Text(
              "Edit Services",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditServices(),
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
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: 4),
            dense: true,
            leading: CircleAvatar(
              child: Icon(Icons.logout),
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              await context.read<AuthenticationService>().signOut();
              // chatProvider.clearList();
              // messageProvider.clearList();
              // postProvider.clearList();
              // serviceProvider.clearList();
              // currentProvider.clearList();
              // orderstProvider.clearList();
              // workerProvider.clearList();
              // storyProvider.clearList();
              userProvider.clearList();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
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
