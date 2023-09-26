part of 'landing_page_bloc.dart';

@immutable
abstract class LandingPageState {}

class LandingPageChanged extends LandingPageState {
  final int pageIndex;
  LandingPageChanged({required this.pageIndex});
}
