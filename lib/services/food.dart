import 'package:food_order/controllers/auth/login.dart';
import 'package:food_order/models/food.dart';
import 'package:food_order/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodServices {
  static final client = http.Client();
  static final LoginController loginController = Get.put(LoginController());
  static final headers = {
    'Authorization': 'Bearer ${loginController.jwt.value}',
    'Content-type': 'application/json; charset=utf-8'
  };

  static Future<List<Food>> fetchFoods() async {
    final response = await client.get(
      Uri.parse('$apiURL/foods'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      return foodFromJson(jsonString);
    } else {
      return [];
    }
  }
}
