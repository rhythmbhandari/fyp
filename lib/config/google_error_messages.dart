class GoogleErrorMessages {

  static String errorMessages(status) {
    if(status.toString().contains('OVER_DAILY_LIMIT')) {
      return 'Your usage limit has expired. Please check if billing is enabled.';
    } else if(status.toString().contains('ZERO_RESULTS')) {
      return 'No routes found. Please choose another place.';
    } else if(status.toString().contains('MAX_ROUTE_LENGTH_EXCEEDED')) {
      return 'The route is too long and cannot be processed.';
    } else {
      return 'Server error: Something went wrong.';
    }
  }
}