import 'dart:convert';
import 'package:gecko_demo/model/coin_model.dart';
import 'package:gecko_demo/utils/constants.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:dio/dio.dart';

class MainViewModel extends GetxController {
  var coinsRateList = [].obs;
  var progessBarVisibility = false.obs;

  @override
  void onInit() {
    getCurrentRates();
    super.onInit();
  }

  void getCurrentRates() async {
    coinsRateList.clear();
    progessBarVisibility.value = true;
    var response = await Dio()
        .get(END_POINT,
            options: _dio.Options(headers: {'accept': 'application/json'}))
        .catchError((e) {
      print(e.toString());
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.toString());
      coinsRateList.add(CoinModel(
          coinName: 'CARDANO',
          rate: double.parse(data['cardano']['usd'].toString())));
      coinsRateList.add(CoinModel(
          coinName: 'ETHEREUM',
          rate: double.parse(data['ethereum']['usd'].toString())));
      coinsRateList.add(CoinModel(
          coinName: 'SOLANA',
          rate: double.parse(data['solana']['usd'].toString())));
      coinsRateList.add(CoinModel(
          coinName: 'TETHER',
          rate: double.parse(data['tether']['usd'].toString())));

      coinsRateList.add(CoinModel(
          coinName: 'BITCOIN',
          rate: double.parse(data['bitcoin']['usd'].toString())));
      progessBarVisibility.value = false;
    }
  }
}
