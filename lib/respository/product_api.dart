import 'dart:convert';
import 'package:http/http.dart' as http;
import '/all_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiRespository>(
  (ref) => ApiRespository(),
);

class ApiRespository {
  String apiKey = '3fd8f21761fc40b2a1c6381992c73e12';

  String baseUrl = 'https://api.spoonacular.com';
  int number = 10;
  Future<List<ProductsApiModel>> exclusiveProductApi() async {
    String query = 'exclusive';

    String params =
        '/food/products/search?apiKey=$apiKey&query=$query&number=$number&addProductInformation=true';

    Map<String, String> headers = {
      "Accept": "application/json",
    };

    try {
      var url = Uri.parse(baseUrl + params);
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body) as Map<String, dynamic>;
        var result = responseData["products"]
            .map<ProductsApiModel>(
                (product) => ProductsApiModel.fromJson(product))
            .toList();

        return result;
      } else {
        if (response.statusCode == 402) {}
      }
    } catch (e) {
      throw ('Not working');
    }
    return [];
  }
  //
  //
  //
  //
  //
  //
  //
  //

  Future<List<ProductsApiModel>> bestSellingProductApi() async {
    String query = 'best selling';

    String params =
        '/food/products/search?apiKey=$apiKey&query=$query&number=$number&addProductInformation=true';

    Map<String, String> headers = {
      "Accept": "application/json",
    };

    try {
      var url = Uri.parse(baseUrl + params);
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body) as Map<String, dynamic>;
        var result = responseData["products"]
            .map<ProductsApiModel>(
                (product) => ProductsApiModel.fromJson(product))
            .toList();

        return result;
      } else {
        if (response.statusCode == 402) {}
      }
    } catch (e) {
      throw ('Not working');
    }
    return [];
  }
  //
  //
  //
  //
  //
  //
  //
  //

  Future<List<ProductsApiModel>> groceriesProductApi() async {
    String query = 'groceries';

    String params =
        '/food/products/search?apiKey=$apiKey&query=$query&number=$number&addProductInformation=true';

    Map<String, String> headers = {
      "Accept": "application/json",
    };

    try {
      var url = Uri.parse(baseUrl + params);
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body) as Map<String, dynamic>;
        var result = responseData["products"]
            .map<ProductsApiModel>(
                (product) => ProductsApiModel.fromJson(product))
            .toList();

        return result;
      } else {
        if (response.statusCode == 402) {}
      }
    } catch (e) {
      throw ('Not working');
    }
    return [];
  }
}
