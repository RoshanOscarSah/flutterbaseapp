import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../network/api_services.dart';

class LocationSearch {
  final String key = dotenv.env['GOOGLEMAP_API_ID'].toString();
  Future<String> getPlaceId(String input) async {
    final String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";
    var response = await ApiServices().get(url: url);
    var placeId = response.data['candidates'][0]['place_id'] as String;

    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var response = await ApiServices().get(url: url);
    var results = response.data['result'] as Map<String, dynamic>;

    return results;
  }
}
