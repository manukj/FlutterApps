import 'dart:io' show Platform;

import 'package:bitcoin_ticker/bitcoin_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Map bitCodeWithRateExchange = Map.fromIterable(cryptoList,
      key: (crypto) => crypto, value: (crypto) => "?");
  String selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CryptoCard(
                  bitcode: cryptoList[0],
                  countryCode: selectedCountry,
                  rateExchange: bitCodeWithRateExchange[cryptoList[0]],
                ),
                CryptoCard(
                  bitcode: cryptoList[1],
                  countryCode: selectedCountry,
                  rateExchange: bitCodeWithRateExchange[cryptoList[0]],
                ),
                CryptoCard(
                  bitcode: cryptoList[2],
                  countryCode: selectedCountry,
                  rateExchange: bitCodeWithRateExchange[cryptoList[0]],
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? getAndroidPicker() : getIosPicker(),
          ),
        ],
      ),
    );
  }

  Widget getIosPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selected) async {
        var data = await BitCoinApi().getCoinData(currenciesList[selected]);
        setState(() {
          bitCodeWithRateExchange = data;
          selectedCountry = currenciesList[selected];
        });
      },
      children: getCountries(),
    );
  }

  List<Text> getCountries() {
    List<Text> countryTextWidget = [];
    for (String country in currenciesList) {
      countryTextWidget.add(Text(country));
    }
    return countryTextWidget;
  }

  Widget getAndroidPicker() {
    return DropdownButton(items: getDropDownMenu(), onChanged: null);
  }

  getDropDownMenu() {
    List<DropdownMenuItem> items = [];
    for (Text country in getCountries()) {
      items.add(DropdownMenuItem(child: country));
    }
    return items;
  }
}

class CryptoCard extends StatelessWidget {
  final String bitcode;
  final String countryCode;
  final String rateExchange;

  const CryptoCard({this.bitcode, this.countryCode, this.rateExchange});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $bitcode = $rateExchange $countryCode',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
