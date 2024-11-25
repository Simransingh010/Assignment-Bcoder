part of 'base_bloc.dart';

@immutable
abstract class BaseEvent {}

class LoginEvent extends BaseEvent {
  final String username;
  final String password;

  LoginEvent({
    required this.username,
    required this.password,
  });
}

class FetchActiveBookingEvent extends BaseEvent {}

class FetchRequestBookingEvent extends BaseEvent {}

class FetchWalletDataEvent extends BaseEvent {}



