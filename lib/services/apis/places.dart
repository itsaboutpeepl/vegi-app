import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

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

class Coordinates {
  final double lat;
  final double lng;
  const Coordinates(this.lat, this.lng);
}

class Candidate {
  Candidate(this.coordinates);
  final Coordinates coordinates;

  @override
  String toString() {
    return 'Candidates(coordinates: {lat:${coordinates.lat},lng:${coordinates.lng}})';
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

  Future<List<Candidate>> fetchLocationByAddress({
    required String addressLineOne,
    required String addressLineTwo,
    required String addressTownCity,
    required String addressPostCode,
    required String addressCountryCode,
  }) async {
    // ~ https://developers.google.com/maps/documentation/places/web-service/search-find-place#find-place-responses
    final Uri request = Uri(
      scheme: 'https',
      host: 'maps.googleapis.com',
      path: 'maps/api/place/findplacefromtext/json',
      queryParameters: {
        'fields': 'geometry',
        'input':
            '$addressLineOne, $addressLineTwo, $addressTownCity, $addressPostCode, $addressCountryCode',
        'inputtype': 'textquery',
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
            List.from(result['candidates'] as Iterable<dynamic>);

        return data
            .where(
              (Map<String, dynamic> element) =>
                  element['geometry']['location'] != null &&
                  element['geometry']['location']['lat'] != null &&
                  num.tryParse(
                          element['geometry']['location']['lat'].toString()) !=
                      null,
            )
            .map(
              (Map<String, dynamic> element) => Candidate(
                Coordinates(
                  element['geometry']['location']['lat'] as double,
                  element['geometry']['location']['lng'] as double,
                ),
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
            List.from(result['predictions'] as Iterable<dynamic>);

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
        final components = List<Map<String, dynamic>>.from(
          result['result']['address_components'] as Iterable<dynamic>,
        );
        // build result
        final place =
            Place(street: '', streetNumber: '', city: '', zipCode: '');
        for (final c in components) {
          final List<String> type = List.from(c['types'] as Iterable<dynamic>);
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
