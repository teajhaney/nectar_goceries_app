import 'dart:convert';
import 'package:http/http.dart' as http;
import '/all_path.dart';

class ApiRespository {
  Future<List<ProductsApiModel>> productApi() async {
    String apiKey = '9ded5051b75845cdbd3017ace3a1bd91';
    String query = 'beverages';
    int number = 2;
    String baseUrl = 'https://api.spoonacular.com';
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

//'https://api.spoonacular.com';

//  FutureBuilder(
//                     future: _futureProducts,
//                     builder: (BuildContext context, AsyncSnapshot snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done) {
//                         var productsData = snapshot.data;
//                         print(snapshot.data);
//                         return DefaultTextStyle(
//                           style:
//                               const TextStyle(decoration: TextDecoration.none),
//                           child: Text(
//                             productsData,
//                             style: getSemiBoldStyle(
//                               color: ColorManager.white,
//                               fontSize: FontSize.fs55,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Text('${snapshot.hasError}'),
//                         );
//                       }
//                       return const Center(
//                           child: CircularProgressIndicator(
//                         color: Color(0xff18B762),
//                       ));
//                     }),