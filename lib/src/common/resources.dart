part of analytics_v2_4_api_client;

class DataResource extends Resource {

  DataResource(Client client) : super(client) {
  }

  /**
   * Returns Analytics report data for a profile.
   *
   * [ids] - Unique table ID for retrieving report data. Table ID is of the form ga:XXXX, where XXXX is the Analytics profile ID.
   *
   * [start_date] - Start date for fetching report data. All requests should specify a start date formatted as YYYY-MM-DD.
   *
   * [end_date] - End date for fetching report data. All requests should specify an end date formatted as YYYY-MM-DD.
   *
   * [metrics] - A comma-separated list of Analytics metrics. E.g., 'ga:visits,ga:pageviews'. At least one metric must be specified to retrieve a valid Analytics report.
   *
   * [dimensions] - A comma-separated list of Analytics dimensions. E.g., 'ga:browser,ga:city'.
   *
   * [filters] - A comma-separated list of dimension or metric filters to be applied to the report data.
   *
   * [max_results] - The maximum number of entries to include in this feed.
   *
   * [segment] - An Analytics advanced segment to be applied to the report data.
   *
   * [sort] - A comma-separated list of dimensions or metrics that determine the sort order for the report data.
   *
   * [start_index] - An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<Map> get(String ids, String start_date, String end_date, String metrics, {String dimensions, String filters, int max_results, String segment, String sort, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "data";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (dimensions != null) queryParams["dimensions"] = dimensions;
    if (end_date == null) paramErrors.add("end_date is required");
    if (end_date != null) queryParams["end-date"] = end_date;
    if (filters != null) queryParams["filters"] = filters;
    if (ids == null) paramErrors.add("ids is required");
    if (ids != null) queryParams["ids"] = ids;
    if (max_results != null) queryParams["max-results"] = max_results;
    if (metrics == null) paramErrors.add("metrics is required");
    if (metrics != null) queryParams["metrics"] = metrics;
    if (segment != null) queryParams["segment"] = segment;
    if (sort != null) queryParams["sort"] = sort;
    if (start_date == null) paramErrors.add("start_date is required");
    if (start_date != null) queryParams["start-date"] = start_date;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(data))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}

class ManagementResource extends Resource {

  ManagementAccountsResource _accounts;
  ManagementAccountsResource get accounts => _accounts;
  ManagementGoalsResource _goals;
  ManagementGoalsResource get goals => _goals;
  ManagementProfilesResource _profiles;
  ManagementProfilesResource get profiles => _profiles;
  ManagementSegmentsResource _segments;
  ManagementSegmentsResource get segments => _segments;
  ManagementWebpropertiesResource _webproperties;
  ManagementWebpropertiesResource get webproperties => _webproperties;

  ManagementResource(Client client) : super(client) {
  _accounts = new ManagementAccountsResource(client);
  _goals = new ManagementGoalsResource(client);
  _profiles = new ManagementProfilesResource(client);
  _segments = new ManagementSegmentsResource(client);
  _webproperties = new ManagementWebpropertiesResource(client);
  }
}

class ManagementAccountsResource extends Resource {

  ManagementAccountsResource(Client client) : super(client) {
  }

  /**
   * Lists all accounts to which the user has access.
   *
   * [max_results] - The maximum number of accounts to include in this response.
   *
   * [start_index] - An index of the first account to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<Map> list({int max_results, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "management/accounts";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (max_results != null) queryParams["max-results"] = max_results;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(data))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}

class ManagementGoalsResource extends Resource {

  ManagementGoalsResource(Client client) : super(client) {
  }

  /**
   * Lists goals to which the user has access.
   *
   * [accountId] - Account ID to retrieve goals for. Can either be a specific account ID or '~all', which refers to all the accounts that user has access to.
   *
   * [webPropertyId] - Web property ID to retrieve goals for. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
   *
   * [profileId] - Profile ID to retrieve goals for. Can either be a specific profile ID or '~all', which refers to all the profiles that user has access to.
   *
   * [max_results] - The maximum number of goals to include in this response.
   *
   * [start_index] - An index of the first goal to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<Map> list(String accountId, String webPropertyId, String profileId, {int max_results, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (accountId == null) paramErrors.add("accountId is required");
    if (accountId != null) urlParams["accountId"] = accountId;
    if (max_results != null) queryParams["max-results"] = max_results;
    if (profileId == null) paramErrors.add("profileId is required");
    if (profileId != null) urlParams["profileId"] = profileId;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (webPropertyId == null) paramErrors.add("webPropertyId is required");
    if (webPropertyId != null) urlParams["webPropertyId"] = webPropertyId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(data))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}

class ManagementProfilesResource extends Resource {

  ManagementProfilesResource(Client client) : super(client) {
  }

  /**
   * Lists profiles to which the user has access.
   *
   * [accountId] - Account ID for the profiles to retrieve. Can either be a specific account ID or '~all', which refers to all the accounts to which the user has access.
   *
   * [webPropertyId] - Web property ID for the profiles to retrieve. Can either be a specific web property ID or '~all', which refers to all the web properties to which the user has access.
   *
   * [max_results] - The maximum number of profiles to include in this response.
   *
   * [start_index] - An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<Map> list(String accountId, String webPropertyId, {int max_results, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (accountId == null) paramErrors.add("accountId is required");
    if (accountId != null) urlParams["accountId"] = accountId;
    if (max_results != null) queryParams["max-results"] = max_results;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (webPropertyId == null) paramErrors.add("webPropertyId is required");
    if (webPropertyId != null) urlParams["webPropertyId"] = webPropertyId;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(data))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}

class ManagementSegmentsResource extends Resource {

  ManagementSegmentsResource(Client client) : super(client) {
  }

  /**
   * Lists advanced segments to which the user has access.
   *
   * [max_results] - The maximum number of advanced segments to include in this response.
   *
   * [start_index] - An index of the first advanced segment to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<Map> list({int max_results, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "management/segments";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (max_results != null) queryParams["max-results"] = max_results;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(data))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}

class ManagementWebpropertiesResource extends Resource {

  ManagementWebpropertiesResource(Client client) : super(client) {
  }

  /**
   * Lists web properties to which the user has access.
   *
   * [accountId] - Account ID to retrieve web properties for. Can either be a specific account ID or '~all', which refers to all the accounts that user has access to.
   *
   * [max_results] - The maximum number of web properties to include in this response.
   *
   * [start_index] - An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  Future<Map> list(String accountId, {int max_results, int start_index, Map optParams}) {
    var completer = new Completer();
    var url = "management/accounts/{accountId}/webproperties";
    var urlParams = new Map();
    var queryParams = new Map();

    var paramErrors = new List();
    if (accountId == null) paramErrors.add("accountId is required");
    if (accountId != null) urlParams["accountId"] = accountId;
    if (max_results != null) queryParams["max-results"] = max_results;
    if (start_index != null) queryParams["start-index"] = start_index;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      completer.completeError(new ArgumentError(paramErrors.join(" / ")));
      return completer.future;
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    response
      .then((data) => completer.complete(data))
      .catchError((e) { completer.completeError(e); return true; });
    return completer.future;
  }
}

