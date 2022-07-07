import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:http/http.dart';
import 'dart:io';

class Place {
  String streetNumber;
  String street;
  String city;
  String zipCode;

  Place({
    required this.streetNumber,
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return 'Place(streetNumber: $streetNumber, street: $street, city: $city, zipCode: $zipCode)';
  }
}

class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  final Client client = Client();

  PlaceApiProvider(this.sessionToken);

  final sessionToken;
  final apiKey = Platform.isIOS ? dotenv.env['MAP_API_KEY_IOS'] ?? "" : dotenv.env['MAP_API_KEY_ANDROID'] ?? "";
  final headers = GoogleApiHeaders().getHeaders();

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
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions'].map<Suggestion>((p) => Suggestion(p['place_id'], p['description'])).toList();
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
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components = result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place(street: '', streetNumber: '', city: '', zipCode: '');
        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality') || type.contains('postal_town')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
        });
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
