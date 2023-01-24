import 'dart:convert';
import 'package:http/http.dart' as http;
import '/all_path.dart';

class ApiRespository {
  String apiKey = '38d827b2ade44b76a897b6d2f3d4fcce';
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

      print(response.statusCode);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body) as Map<String, dynamic>;
        var result = responseData["products"]
            .map<ProductsApiModel>(
                (product) => ProductsApiModel.fromJson(product))
            .toList();

        return result;
      } else {
        if (response.statusCode == 402) {
          print(response.statusCode);
        }
      }
    } catch (e) {
      print(e);
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

  Future<List<ProductsApiModel>> bestSellingProductApi2() async {
    String query = 'best selling';

    String params =
        '/food/products/search?apiKey=$apiKey&query=$query&number=$number&addProductInformation=true';

    Map<String, String> headers = {
      "Accept": "application/json",
    };

    try {
      var url = Uri.parse(baseUrl + params);
      var response = await http.get(url, headers: headers);

      print(response.statusCode);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body) as Map<String, dynamic>;
        var result = responseData["products"]
            .map<ProductsApiModel>(
                (product) => ProductsApiModel.fromJson(product))
            .toList();

        return result;
      } else {
        if (response.statusCode == 402) {
          print(response.statusCode);
        }
      }
    } catch (e) {
      print(e);
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

  Future<List<ProductsApiModel>> groceriesProductApi2() async {
    String query = 'groceries';

    String params =
        '/food/products/search?apiKey=$apiKey&query=$query&number=$number&addProductInformation=true';

    Map<String, String> headers = {
      "Accept": "application/json",
    };

    try {
      var url = Uri.parse(baseUrl + params);
      var response = await http.get(url, headers: headers);

      print(response.statusCode);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body) as Map<String, dynamic>;
        var result = responseData["products"]
            .map<ProductsApiModel>(
                (product) => ProductsApiModel.fromJson(product))
            .toList();

        return result;
      } else {
        if (response.statusCode == 402) {
          print(response.statusCode);
        }
      }
    } catch (e) {
      print(e);
      throw ('Not working');
    }
    return [];
  }
}
