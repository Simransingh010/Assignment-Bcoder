part of 'base_bloc.dart';

@immutable
class BaseState {
  final RequestBooking? requestBooking;
  final List<ActiveBooking>? activeBookings;
  final WalletResponse? walletData;
  final bool isLoading;
  final String? error;

  const BaseState({
    this.requestBooking,
    this.activeBookings,
    this.walletData,
    this.isLoading = false,
    this.error,
  });

  BaseState copyWith({
    RequestBooking? requestBooking,
    List<ActiveBooking>? activeBookings,
    WalletResponse? walletData,
    bool? isLoading,
    String? error,
  }) {
    return BaseState(
      requestBooking: requestBooking ?? this.requestBooking,
      activeBookings: activeBookings ?? this.activeBookings,
      walletData: walletData ?? this.walletData,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class BaseInitial extends BaseState {}

class BaseLoadingState extends BaseState {}

class LoginSuccessState extends BaseState {
  final Map<String, dynamic> userData;

  LoginSuccessState(this.userData);

  @override
  String toString() => 'LoginSuccessState: $userData';
}

class BaseErrorState extends BaseState {
  final String message;

  BaseErrorState(this.message);

  @override
  String toString() => 'BaseErrorState: $message';
}

class RequestBookingLoadedState extends BaseState {
  final RequestBooking booking;

  RequestBookingLoadedState(this.booking);

  @override
  String toString() => 'ActiveBookingLoadedState: $booking';
}

class ActiveBookingsLoadedState extends BaseState {
  final List<ActiveBooking> bookings;

  ActiveBookingsLoadedState(this.bookings);

  @override
  String toString() => 'ActiveBookingsLoadedState: ${bookings.length} bookings';
}

class WalletDataLoadedState extends BaseState {
  final WalletResponse walletData;

  WalletDataLoadedState(this.walletData);

  @override
  String toString() => 'WalletDataLoadedState: ${walletData.status}';
}
