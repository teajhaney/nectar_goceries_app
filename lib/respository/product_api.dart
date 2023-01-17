import 'dart:convert';
import 'package:http/http.dart' as http;
import '/all_path.dart';

class ApiRespository {
  Future<List<ProductsApiModel>> productApi() async {
    String apiKey = '0b22242828094a0baeb4de2ef010330a';
    String query = 'beverages';
    int number = 100;
    String baseUrl = '';
    String params =
        '/food/products/search?apiKey=$apiKey&query=$query&number=$number&addProductInformation=true';

    Map<String, String> headers = {
      "Accept": "application/json",
    };

    var url = Uri.parse(baseUrl + params);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseData = jsonDecode(response.body);
      print(responseData);

      return List<ProductsApiModel>.from(
          responseData.map((data) => ProductsApiModel.fromJson(data)));
    } else {
      if (response.statusCode == 402) {
        print(response.statusCode);
      }
    }
    throw ('Not working');
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