import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PostregisterCall {
  static Future<ApiCallResponse> call({
    dynamic? nameJson,
    dynamic? cityJson,
    dynamic? stateJson,
    dynamic? phoneJson,
    dynamic? bioJson,
  }) {
    final name = _serializeJson(nameJson);
    final city = _serializeJson(cityJson);
    final state = _serializeJson(stateJson);
    final phone = _serializeJson(phoneJson);
    final bio = _serializeJson(bioJson);
    final body = '''
{
      "name": "name",
      "city": "city",
      "state": "state",
       "phone": "phone",
       "bio": "bio"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postregister',
      apiUrl: 'https://reqres.in/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostLoginCall {
  static Future<ApiCallResponse> call({
    dynamic? loginJson,
  }) {
    final login = _serializeJson(loginJson);
    final body = '''
{
  "email": "",
  "password": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postLogin',
      apiUrl: 'https://reqres.in/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUsersCall {
  static Future<ApiCallResponse> call({
    List<int>? homepageList,
  }) {
    final homepage = _serializeList(homepageList);

    return ApiManager.instance.makeApiCall(
      callName: 'getUsers',
      apiUrl: 'https://reqres.in/api/users',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'homepage': homepage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostLoginUnsuccessfulCall {
  static Future<ApiCallResponse> call({
    dynamic? loginUnsuccessfulJson,
  }) {
    final loginUnsuccessful = _serializeJson(loginUnsuccessfulJson);
    final body = '''
{
  "email": "peter@klaven"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postLoginUnsuccessful',
      apiUrl: 'https://reqres.in/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HTTPRequestCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "grantType": "string",
  "audience": "string",
  "scope": "string",
  "requestedTokenType": "string",
  "subjectToken": "string",
  "subjectTokenType": "string",
  "options": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HTTP request',
      apiUrl: 'https://sts.googleapis.com/v1/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
