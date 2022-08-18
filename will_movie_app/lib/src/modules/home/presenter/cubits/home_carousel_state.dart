import 'package:core_module/core_module.dart';

abstract class HomeCarouselState {}

class HomeCarouselInitialState extends HomeCarouselState {}

class HomeCarouselLoadingState extends HomeCarouselState {}

class HomeCarouselSuccessState extends HomeCarouselState {
  final List<String> movies;

  HomeCarouselSuccessState(this.movies);
}

class HomeCarouselErrorState extends HomeCarouselState {
  final Failure error;

  HomeCarouselErrorState(this.error);
}
