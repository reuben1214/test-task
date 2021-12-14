import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:gecko_demo/model/coin_model.dart';
import 'package:gecko_demo/utils/resources.dart';
import 'package:gecko_demo/view/widgets/molecules/input_field_and_label.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final coinTextEditingController = TextEditingController();
  final usdTextEditingController = TextEditingController();
  late CoinModel coinModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    coinModel = ModalRoute.of(context)!.settings.arguments as CoinModel;
    coinTextEditingController.text = '1';
    usdTextEditingController.text = coinModel.rate.toString();

    return Scaffold(
      appBar: AppBar(
          title: Text("${coinModel.coinName} to USD Calculator"),
          backgroundColor: Resources.mainFillColor),
      body: ContainerPlus(
          color: Resources.mainFillColorLight,
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputFieldAndLabel(
                      onValueChange: onCoinValueChanged,
                      label: coinModel.coinName,
                      size: size,
                      textEditingController: coinTextEditingController),
                  InputFieldAndLabel(
                      onValueChange: onUsdValueChanged,
                      label: 'USD',
                      size: size,
                      textEditingController: usdTextEditingController)
                ],
              ),
            ],
          )),
    );
  }

  void onCoinValueChanged(String v) {
    if (v.isNotNullOrEmpty) {
      var value = double.parse(v);
      usdTextEditingController.text =
          (coinModel.rate * value).toStringAsFixed(7);
    }
  }

  void onUsdValueChanged(String v) {
    if (v.isNotNullOrEmpty) {
      var value = double.parse(v);
      coinTextEditingController.text =
          (value / coinModel.rate).toStringAsFixed(7);
    }
  }
}
