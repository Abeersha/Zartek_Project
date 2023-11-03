import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zartek_project/model%20/foodmenu.dart';

class ApiService {
  Future<List<Foodmenu>> fetchHomeDatas() async {
    dynamic response = await http.get(Uri.parse(
        'http://run.mocky.io/v3/4d116e3e-808c-43ab-93ed-6c70540d4e18#'));

    return Foodmenu.fromList(json.decode(response.body));
  }
}
