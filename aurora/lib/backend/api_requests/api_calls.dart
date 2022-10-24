import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetWeatherDataRealCall {
  static Future<ApiCallResponse> call({
    double? lon = 123.885773,
    double? lat = 10.607936,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getWeatherDataReal',
      apiUrl: 'https://weatherbit-v1-mashape.p.rapidapi.com/current',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '49fb7ca1e0msh1d3b04868f618a2p11c429jsn448c47389526',
        'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com',
      },
      params: {
        'lon': lon,
        'lat': lat,
      },
      returnBody: true,
    );
  }
}

class GetLocationCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getLocation',
      apiUrl: 'https://ip-geo-location.p.rapidapi.com/ip/check',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '49fb7ca1e0msh1d3b04868f618a2p11c429jsn448c47389526',
        'X-RapidAPI-Host': 'ip-geo-location.p.rapidapi.com',
      },
      params: {
        'format': "json",
      },
      returnBody: true,
    );
  }

  static dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.location.latitude''',
      );
  static dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.location.longitude''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.city.name''',
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.country.name''',
      );
}

class WeatherAPICall {
  static Future<ApiCallResponse> call({
    String? q = 'Cebu',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'weatherAPI',
      apiUrl: 'https://weatherapi-com.p.rapidapi.com/current.json',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '49fb7ca1e0msh1d3b04868f618a2p11c429jsn448c47389526',
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
      },
      params: {
        'q': q,
      },
      returnBody: true,
    );
  }

  static dynamic temp(dynamic response) => getJsonField(
        response,
        r'''$.current.temp_c''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
