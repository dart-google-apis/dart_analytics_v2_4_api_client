library analytics_v2_4_api.console;

import "package:google_oauth2_client/google_oauth2_console.dart" as oauth2;

import 'package:google_analytics_v2_4_api/src/console_client.dart';

import "package:google_analytics_v2_4_api/analytics_v2_4_api_client.dart";

/** View and manage your Google Analytics data */
class Analytics extends Client with ConsoleClient {

  /** OAuth Scope2: View and manage your Google Analytics data */
  static const String ANALYTICS_SCOPE = "https://www.googleapis.com/auth/analytics";

  /** OAuth Scope2: View your Google Analytics data */
  static const String ANALYTICS_READONLY_SCOPE = "https://www.googleapis.com/auth/analytics.readonly";

  final oauth2.OAuth2Console auth;

  Analytics([oauth2.OAuth2Console this.auth]);
}
