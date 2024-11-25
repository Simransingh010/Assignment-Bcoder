import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/base_bloc.dart';
import 'widgets/booking_request_card.dart';
import 'widgets/active_booking_card.dart';
import '../../data/models/active_booking_model.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late final BaseBloc _baseBloc;

  @override
  void initState() {
    super.initState();
    _baseBloc = BaseBloc()
      ..add(FetchRequestBookingEvent())
      ..add(FetchActiveBookingEvent());
  }

  @override
  void dispose() {
    _baseBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _baseBloc,
      child: const BookingScreenContent(),
    );
  }
}

class BookingScreenContent extends StatefulWidget {
  const BookingScreenContent({super.key});

  @override
  State<BookingScreenContent> createState() => _BookingScreenContentState();
}

class _BookingScreenContentState extends State<BookingScreenContent> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Bookings',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(CupertinoIcons.bell, color: Colors.white, size: 20),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blue.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your available for booking',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                  Switch(
                    activeTrackColor: Colors.green,
                    value: isAvailable,
                    inactiveThumbColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        isAvailable = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Requests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<BaseBloc, BaseState>(
                builder: (context, state) {
                  if (state.isLoading && state.requestBooking == null) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state.error != null) {
                    return Center(
                      child: Column(
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          const SizedBox(height: 8),
                          Text(
                            'Error: ${state.error}',
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  if (state.requestBooking != null) {
                    return BookingRequestCard(
                      photo: state.requestBooking!.photo,
                      name: state.requestBooking!.name,
                      price: state.requestBooking!.amount,
                      bookingInfo:
                          'Booking for: ${state.requestBooking!.bookingTime}',
                      bookingId: state.requestBooking!.bookingId,
                      location: state.requestBooking!.address,
                      onAccept: () {},
                      onDecline: () {},
                    );
                  }

                  return const Center(
                    child: Text('No booking requests available'),
                  );
                },
              ),
            ),

          
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Active Bookings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<BaseBloc, BaseState>(
                    builder: (context, state) {
                      if (state.isLoading && state.activeBookings == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.activeBookings != null) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.activeBookings!.length,
                          itemBuilder: (context, index) {
                            final booking = state.activeBookings![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ActiveBookingCard(
                                photo: booking.photo,
                                name: booking.name,
                                price: booking.amount,
                                bookingInfo:
                                    'Booking for: ${booking.bookingTime}',
                                bookingId: booking.bookingId,
                                location: booking.address,
                                status: 'in_progress',
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
