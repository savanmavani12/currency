import 'dart:convert';
import 'package:currency/model/models.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;

class ConvertHelpers {
  ConvertHelpers._();

  static ConvertHelpers convertHelpers = ConvertHelpers._();

  String base =
      "https://api.exchangerate.host/convert?from=USD&to=EUR&amount=2";

  Future<CurrencyConvert?> convert() async {
    String api = base;
    http.Response data = await http.get(Uri.parse(api));
    if (data.statusCode == 200) {
      Map decodeData = jsonDecode(data.body);
      CurrencyConvert allData = CurrencyConvert.fromMap(data: decodeData);

      return allData;
    }
    return null;
  }
 Future<List> getJsonData() async {
    String data = await rootBundle.loadString("assets/jsonData.json");
    return jsonDecode(data);
   }
}
