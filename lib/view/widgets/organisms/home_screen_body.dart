import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:gecko_demo/utils/resources.dart';
import 'package:gecko_demo/utils/utils.dart';
import 'package:gecko_demo/view/screens/calculator_screen.dart';
import 'package:gecko_demo/view/widgets/molecules/coins_list_item.dart';
import 'package:gecko_demo/view_model/main_view_model.dart';
import 'package:get/get.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key, required this.mainViewModel})
      : super(key: key);
  final MainViewModel mainViewModel;
  @override
  Widget build(BuildContext context) {
    return ContainerPlus(
        color: Resources.mainFillColorLight,
        child: Obx(() => ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: mainViewModel.coinsRateList.length,
            itemBuilder: (BuildContext context, int index) {
              var coin = mainViewModel.coinsRateList[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(Utils.createRouteWithArguments(
                      coin, const CalculatorScreen()));
                },
                child:
                    ListItem(coinName: coin.coinName, rate: "\$${coin.rate}"),
              );
            })));
  }
}
