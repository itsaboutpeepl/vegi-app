import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:http/http.dart';

class Place {
  Place({
    required this.streetNumber,
    required this.street,
    required this.city,
    required this.zipCode,
  });
  String streetNumber;
  String street;
  String city;
  String zipCode;

  @override
  String toString() {
    return 'Place(streetNumber: $streetNumber, street: $street, city: $city, zipCode: $zipCode)';
  }
}

class Suggestion {
  Suggestion(this.placeId, this.description);
  final String placeId;
  final String description;

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  PlaceApiProvider(this.sessionToken);
  final Client client = Client();

  final String sessionToken;
  final String apiKey = Platform.isIOS
      ? dotenv.env['MAP_API_KEY_IOS'] ?? ''
      : dotenv.env['MAP_API_KEY_ANDROID'] ?? '';
  final Future<Map<String, String>> headers =
      const GoogleApiHeaders().getHeaders();

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    final Uri request = Uri(
      scheme: 'https',
      host: 'maps.googleapis.com',
      path: 'maps/api/place/autocomplete/json',
      queryParameters: {
        'input': input,
        'types': 'address',
        'language': 'en',
        'components': 'country:gb',
        'key': apiKey,
        'sessionToken': sessionToken
      },
    );
    final response = await client.get(request, headers: await headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> result =
          json.decode(response.body) as Map<String, dynamic>;
      if (result['status'] == 'OK') {
        // compose suggestions in a list

        final List<Map<String, dynamic>> data =
            result['predictions'] as List<Map<String, dynamic>>;

        return data
            .map(
              (Map<String, dynamic> element) => Suggestion(
                element['place_id'] as String? ?? '',
                element['description'] as String? ?? '',
              ),
            )
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final Uri request = Uri(
      scheme: 'https',
      host: 'maps.googleapis.com',
      path: 'maps/api/place/details/json',
      queryParameters: {
        'place_id': placeId,
        'fields': 'address_component',
        'key': apiKey,
        'sessionToken': sessionToken
      },
    );

    final response = await client.get(request, headers: await headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> result =
          json.decode(response.body) as Map<String, dynamic>;
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        final place =
            Place(street: '', streetNumber: '', city: '', zipCode: '');
        for (final c in components) {
          final List type = c['types'] as List<String>;
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'] as String? ?? '';
          }
          if (type.contains('route')) {
            place.street = c['long_name'] as String? ?? '';
          }
          if (type.contains('locality') || type.contains('postal_town')) {
            place.city = c['long_name'] as String? ?? '';
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'] as String? ?? '';
          }
        }
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
