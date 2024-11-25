import 'package:bcoder_assignment/auth/auth_service.dart';
import 'package:bcoder_assignment/data/models/active_booking_model.dart';
import 'package:bcoder_assignment/data/models/request_booking_model.dart';
import 'package:bcoder_assignment/data/models/wallet_model.dart';
import 'package:bcoder_assignment/data/repo/request_booking_repo.dart';
import 'package:bcoder_assignment/data/repo/wallet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../data/repo/active_booking_repo.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  final AuthService _authService = AuthService();
  final RequestBookingRepository _bookingRepository =
      RequestBookingRepository();
  final ActiveBookingRepository _activeBookingRepository =
      ActiveBookingRepository();
  final WalletRepository _walletRepository = WalletRepository();

  BaseBloc() : super(const BaseState()) {
    on<LoginEvent>(_handleLogin);
    on<FetchRequestBookingEvent>(_handleFetchRequestBooking);
    on<FetchActiveBookingEvent>(_handleFetchActiveBookings);
    on<FetchWalletDataEvent>(_handleFetchWalletData);
  }

  Future<void> _handleLogin(
    LoginEvent event,
    Emitter<BaseState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      
      final userData = await _authService.login(
        event.username,
        event.password,
      );
      
      emit(LoginSuccessState(userData));
    } catch (e) {
      emit(BaseErrorState(e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _handleFetchRequestBooking(
    FetchRequestBookingEvent event,
    Emitter<BaseState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final requestBooking = await _bookingRepository.fetchActiveBooking();
      emit(state.copyWith(
        requestBooking: requestBooking,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _handleFetchActiveBookings(
    FetchActiveBookingEvent event,
    Emitter<BaseState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final activeBookings = await _activeBookingRepository.fetchActiveBookings();
      emit(state.copyWith(
        activeBookings: activeBookings,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _handleFetchWalletData(
    FetchWalletDataEvent event,
    Emitter<BaseState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final walletData = await _walletRepository.fetchWalletData();
      emit(state.copyWith(
        walletData: walletData,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }
}
