import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Loginprovider with ChangeNotifier {
  bool isloading = false;

  void setLoading(bool value) {
    isloading = value;
    notifyListeners();
  }

  Future<void> Login(String email, String password) async {
    try {
      setLoading(true); // request start → loading true

      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('✅ Login successfully with provider');
      } else {
        print('❌ Login failed: ${response.body}');
      }
    } catch (e) {
      print('⚠️ Error: $e');
    } finally {
      setLoading(false); // request complete → loading false
    }
  }
}
