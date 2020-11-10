import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  final String url;

  HttpHelper(this.url);

  Future getAPIData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('deu ruim');
      print(response.statusCode);
    }
  }
}
