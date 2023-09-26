part of 'landing_page_bloc.dart';

@immutable
abstract class LandingPageEvent {}

class LandingPageIndexChangedEvent extends LandingPageEvent{
  final int newIndex;
  LandingPageIndexChangedEvent({required this.newIndex});
}
