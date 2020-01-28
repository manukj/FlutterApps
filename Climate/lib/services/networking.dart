import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getClimateData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Status code =" + response.statusCode.toString());
    }

//    double temp = decodedData['temp'];
//    int condition = decodedData['weather'][0]['id'];
//    String cityName = decodedData['name'];
//    print(cityName);
  }
}
