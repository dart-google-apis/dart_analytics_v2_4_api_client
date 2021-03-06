part of analytics_v2_4_api;

class DataResource_ {

  final Client _client;

  DataResource_(Client client) :
      _client = client;

  /**
   * Returns Analytics report data for a view (profile).
   *
   * [ids] - Unique table ID for retrieving report data. Table ID is of the form ga:XXXX, where XXXX is the Analytics view (profile) ID.
   *
   * [start_date] - Start date for fetching report data. All requests should specify a start date formatted as YYYY-MM-DD.
   *
   * [end_date] - End date for fetching report data. All requests should specify an end date formatted as YYYY-MM-DD.
   *
   * [metrics] - A comma-separated list of Analytics metrics. E.g., 'ga:sessions,ga:pageviews'. At least one metric must be specified to retrieve a valid Analytics report.
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
  async.Future<core.Map> get(core.String ids, core.String start_date, core.String end_date, core.String metrics, {core.String dimensions, core.String filters, core.int max_results, core.String segment, core.String sort, core.int start_index, core.Map optParams}) {
    var url = "data";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
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
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

class ManagementResource_ {

  final Client _client;

  final ManagementAccountsResource_ accounts;
  final ManagementGoalsResource_ goals;
  final ManagementProfilesResource_ profiles;
  final ManagementSegmentsResource_ segments;
  final ManagementWebpropertiesResource_ webproperties;

  ManagementResource_(Client client) :
      _client = client,
      accounts = new ManagementAccountsResource_(client),
      goals = new ManagementGoalsResource_(client),
      profiles = new ManagementProfilesResource_(client),
      segments = new ManagementSegmentsResource_(client),
      webproperties = new ManagementWebpropertiesResource_(client);
}

class ManagementAccountsResource_ {

  final Client _client;

  ManagementAccountsResource_(Client client) :
      _client = client;

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
  async.Future<core.Map> list({core.int max_results, core.int start_index, core.Map optParams}) {
    var url = "management/accounts";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
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
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

class ManagementGoalsResource_ {

  final Client _client;

  ManagementGoalsResource_(Client client) :
      _client = client;

  /**
   * Lists goals to which the user has access.
   *
   * [accountId] - Account ID to retrieve goals for. Can either be a specific account ID or '~all', which refers to all the accounts that user has access to.
   *
   * [webPropertyId] - Web property ID to retrieve goals for. Can either be a specific web property ID or '~all', which refers to all the web properties that user has access to.
   *
   * [profileId] - View (Profile) ID to retrieve goals for. Can either be a specific view (profile) ID or '~all', which refers to all the views (profiles) that user has access to.
   *
   * [max_results] - The maximum number of goals to include in this response.
   *
   * [start_index] - An index of the first goal to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> list(core.String accountId, core.String webPropertyId, core.String profileId, {core.int max_results, core.int start_index, core.Map optParams}) {
    var url = "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles/{profileId}/goals";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
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
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

class ManagementProfilesResource_ {

  final Client _client;

  ManagementProfilesResource_(Client client) :
      _client = client;

  /**
   * Lists views (profiles) to which the user has access.
   *
   * [accountId] - Account ID for the views (profiles) to retrieve. Can either be a specific account ID or '~all', which refers to all the accounts to which the user has access.
   *
   * [webPropertyId] - Web property ID for the views (profiles) to retrieve. Can either be a specific web property ID or '~all', which refers to all the web properties to which the user has access.
   *
   * [max_results] - The maximum number of views (profiles) to include in this response.
   *
   * [start_index] - An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
   *   Minimum: 1
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> list(core.String accountId, core.String webPropertyId, {core.int max_results, core.int start_index, core.Map optParams}) {
    var url = "management/accounts/{accountId}/webproperties/{webPropertyId}/profiles";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
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
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

class ManagementSegmentsResource_ {

  final Client _client;

  ManagementSegmentsResource_(Client client) :
      _client = client;

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
  async.Future<core.Map> list({core.int max_results, core.int start_index, core.Map optParams}) {
    var url = "management/segments";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
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
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

class ManagementWebpropertiesResource_ {

  final Client _client;

  ManagementWebpropertiesResource_(Client client) :
      _client = client;

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
  async.Future<core.Map> list(core.String accountId, {core.int max_results, core.int start_index, core.Map optParams}) {
    var url = "management/accounts/{accountId}/webproperties";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
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
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

