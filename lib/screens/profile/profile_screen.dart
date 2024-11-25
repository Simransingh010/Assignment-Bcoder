import 'package:bcoder_assignment/screens/profile/widgets/account_options.dart';
import 'package:bcoder_assignment/screens/profile/widgets/booking_option.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Card(
          color: Colors.white,
          shape: CircleBorder(),
          child: const BackButton(),
        ),
        actions: [
          Card(
            color: Colors.white,
            shape: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        const Text(
                          'John Smith',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '99987-57456',
                              style: TextStyle(
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'John@gmail.com',
                              style: TextStyle(
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -15,
                    left: MediaQuery.of(context).size.width * 0.35,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'https://example.com/profile-image.jpg', 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis condimentum lorem\nIn vitae accumsan dolor',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manage Bookings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    BookingOption(
                      icon: Icons.calendar_today,
                      title: 'Past Booking',
                      color: Colors.purple,
                    ),
                    SizedBox(height: 12),
                    BookingOption(
                      icon: Icons.star,
                      title: 'Reviews',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    AccountOption(
                      icon: Icons.wallet,
                      title: 'My Wallet',
                      color: Colors.green,
                    ),
                    SizedBox(height: 12),
                    AccountOption(
                      icon: Icons.lock,
                      title: 'Change Password',
                      color: Colors.orange,
                    ),
                    SizedBox(height: 12),
                    AccountOption(
                      icon: Icons.report_problem,
                      title: 'Report a Problem',
                      color: Colors.red,
                    ),
                    SizedBox(height: 12),
                    AccountOption(
                      icon: Icons.description,
                      title: 'Terms and Conditions',
                      color: Colors.purple,
                    ),
                    SizedBox(height: 12),
                    AccountOption(
                      icon: Icons.privacy_tip,
                      title: 'Privacy Policy',
                      color: Colors.blue,
                    ),
                    SizedBox(height: 12),
                    AccountOption(
                      icon: Icons.delete,
                      title: 'Delete Account',
                      color: Colors.red,
                    ),
                    SizedBox(height: 12),
                    AccountOption(
                      icon: Icons.logout,
                      title: 'Logout',
                      color: Colors.grey,
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
