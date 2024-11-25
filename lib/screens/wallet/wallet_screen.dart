import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/base_bloc.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BaseBloc>().add(FetchWalletDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Wallet',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocBuilder<BaseBloc, BaseState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }

          if (state.walletData == null) {
            return const Center(child: Text('No wallet data available'));
          }

          final walletData = state.walletData!.data;
          final transactions = walletData.transactions;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Wallet Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${walletData.wallet.balance}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: const Size(200, 45),
                            ),
                            child: const Text(
                              'Withdrawal',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  Card(
                    color: Colors.blue.shade50,
                    margin: EdgeInsets.zero,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Transaction History',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              final isWithdrawal = transaction.type == 'Debit';

                              return Container(
                                decoration: BoxDecoration(
                                  border: index != transactions.length - 1
                                      ? Border(
                                          bottom: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 1,
                                          ),
                                        )
                                      : null,
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: isWithdrawal
                                        ? Colors.red.shade100
                                        : Colors.green.shade100,
                                    child: Icon(
                                      isWithdrawal
                                          ? Icons.arrow_downward
                                          : Icons.arrow_upward,
                                      color: isWithdrawal
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                  ),
                                  title: Text(
                                    transaction.description,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                    transaction.transactionId,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${isWithdrawal ? "- " : "+ "}${transaction.amount}',
                                        style: TextStyle(
                                          color: isWithdrawal
                                              ? Colors.red
                                              : Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('E dd MMM, hh:mm a')
                                            .format(transaction.date),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
