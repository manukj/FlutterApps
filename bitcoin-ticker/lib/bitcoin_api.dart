import 'dart:convert';

import 'package:http/http.dart' as http;

import 'coin_data.dart';

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class BitCoinApi {
  var apiKey = "4013740E-A4EB-4620-A60B-40A8E7B9C0A3";

  Future getCoinData(String selectedCurrency) async {
    //4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //5: Return a Map of the results instead of a single value.
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      //Update the URL to use the crypto symbol from the cryptoList
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      print(requestURL);
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        //Create a new key value pair, with the key being the crypto symbol and the value being the lastPrice of that crypto currency.
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
