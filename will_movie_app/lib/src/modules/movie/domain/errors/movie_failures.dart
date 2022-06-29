import 'package:core_module/core_module.dart';

abstract class NoInternetConnection extends Failure {}

class NoDataFound extends Failure {}

class MovieNowPlayingNoInternetConnection extends NoInternetConnection {}

class MovieNowPlayingError extends Failure {
  MovieNowPlayingError(
    StackTrace stackTrace,
    String label,
    dynamic exception,
    String errorMessage,
  ) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
