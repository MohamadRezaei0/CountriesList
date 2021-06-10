import 'package:countrylist/constants/constants.dart';
import 'package:http/http.dart' as http;

class CountryListRepository {
  static Future<Stream<http.Response>> getCountryList() async {
    final Uri uri = Uri.parse(Constants.baseUrl);
    var streamResponse = http.get(uri).asStream();
    return streamResponse;
  }
}
