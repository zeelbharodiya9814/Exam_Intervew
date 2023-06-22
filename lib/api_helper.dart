import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modal/country_class.dart';


class APIHelper {
  // Singleton object
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  Future<List<Country>?> fetchCountry({String pacl = "india"}) async {

    String k = pacl;
    // // String country = "World";
    // String apiKey = "S2Sf+/GZxp2PX9GstwxA5Q==mixXSYL4gAshOZnI";
    // String api = "https://countriesnow.space/api/v0.1/countries/flag/images";
    String api = "https://ajayakv-rest-countries-v1.p.rapidapi.com/rest/v1/all";

    http.Response res = await http.get(Uri.parse(api),
      headers: {
        'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
        'X-RapidAPI-Host': 'ajayakv-rest-countries-v1.p.rapidapi.com'
      }
    );
    print(res);

    // http.Response res1 = await http.get(Uri.parse(api1),);
    // print(res1);

    if(res.statusCode == 200) {
      Map decodedData = json.decode(res.body);

      //row data => customdata
      List data = decodedData['data'];
      print(data);
      List<Country> k1 = data.map((e) => Country.fromMap(data: e),).toList();

      print(decodedData);
      return k1;
    }

    // if(res1.statusCode == 200) {
    //   Map decodedData = json.decode(res1.body);
    //
    //   //row data => customdata
    //   List data = decodedData['data'];
    //   print(data);
    //   List<Country> k1 = data.map((e) => Country.fromMap(data: e),).toList();
    //
    //   print(decodedData);
    //   return k1;
    // }

  }
}




