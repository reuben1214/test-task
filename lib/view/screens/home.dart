import 'package:flutter/material.dart';
import 'package:gecko_demo/utils/constants.dart';
import 'package:gecko_demo/utils/resources.dart';
import 'package:gecko_demo/view/widgets/atoms/circle_progress_indicator.dart';
import 'package:gecko_demo/view/widgets/atoms/refresh_button.dart';
import 'package:gecko_demo/view/widgets/organisms/home_screen_body.dart';
import 'package:gecko_demo/view_model/main_view_model.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MainViewModel mainViewModel = Get.put(MainViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HOME_APP_BAR_TITLE),
        backgroundColor: Resources.mainFillColor,
        actions: [RefreshButton(onTap: () => mainViewModel.getCurrentRates())],
      ),
      body: Stack(
        children: [
          HomeScreenBody(mainViewModel: mainViewModel),
          Obx(() => CircleProgressInd(
              visibility: mainViewModel.progessBarVisibility.value))
        ],
      ),
    );
  }
}
