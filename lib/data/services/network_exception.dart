import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);
  @override
  String toString() {
    return 'Not found page 404';
  }
}

class BadGatewayException extends DioError {
  BadGatewayException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);
  @override
  String toString() {
    return 'The server was acting as a gateway or proxy and received an invalid response from the upstream server';
  }
}

// UnauthorizedException
class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);
  @override
  String toString() {
    return 'The response must include a WWW-Authenticate header field containing a challenge applicable to the requested resource.';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineException extends DioError {
  DeadlineException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Please try again. Something went wrong. Don\'t wait';
  }
}
// DeadlineException