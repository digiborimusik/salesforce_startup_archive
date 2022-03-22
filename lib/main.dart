import 'package:***REMOVED***/domain/services/connections_service.dart';
import 'package:***REMOVED***/presentation/controllers/user_data_controller.dart';
import 'package:***REMOVED***/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

main() async {
  await initServices();
  runApp(App());
}

Future initServices() async {
  print('starting services ...');
  await GetStorage.init();
  await Get.putAsync(() => ConnectionService().init());
  print('All services started...');
}

class App extends StatelessWidget {
  final UserDataController userDataController =
      Get.put(UserDataController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Obx(() {
        return userDataController.authData == null ? Splash() : HomeScreen();
      }),
    );
  }
}

class Splash extends StatelessWidget {
  final UserDataController userDataController = Get.put(UserDataController());
  final ConnectionService connectionService = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        bool s = connectionService.hasConnection;
        print(s);
        return Center(child: Text('Loading'));
      }),
    );
  }
}
