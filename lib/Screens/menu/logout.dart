import 'package:flutter/material.dart';
import 'package:housecontractors/providers/contractor_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication_provider.dart';
import '../../providers/chat_provider.dart';
import '../../providers/inventory_provider.dart';
import '../../providers/message_provider.dart';
import '../../providers/order_provider.dart';
import '../../providers/service_log_provider.dart';
import '../../providers/worker_provider.dart';
import '../../widgets/are_you_sure.dart';
import '../loginSignup/login.dart';

class Logout extends StatelessWidget {
  const Logout({
    Key? key,
    required this.chatProvider,
    required this.messageProvider,
    required this.orderstProvider,
    required this.workerProvider,
    required this.slog,
    required this.ilog,
  }) : super(key: key);

  final ChatProvider chatProvider;
  final MessageProvider messageProvider;
  final OrdersProvider orderstProvider;
  final WorkerProvider workerProvider;
  final ServiceLogsProvider slog;
  final InventoryProvider ilog;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        visualDensity: const VisualDensity(vertical: 4),
        dense: true,
        leading: const CircleAvatar(
          child: Icon(Icons.logout),
        ),
        title: const Text(
          "Logout",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        onTap: () => showDialog(
              context: context,
              builder: (context) => AreYouSure(
                title: "Do you want to logout?",
                onPressed: () async {
                  await context
                      .read<AuthenticationService>()
                      .signOut()
                      .then((value) {
                    chatProvider.clearList();
                    messageProvider.clearList();
                    orderstProvider.clearList();
                    workerProvider.clearList();
                    slog.clearList();
                    ilog.clearList();
                    currentUserID = "";
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  });
                },
              ),
            ));
  }
}
