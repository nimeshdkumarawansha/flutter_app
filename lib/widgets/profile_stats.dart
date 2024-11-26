import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final double walletAmount;
  final int orderCount;

  const ProfileStats({
    super.key,
    required this.walletAmount,
    required this.orderCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[500]!),
          bottom: BorderSide(color: Colors.grey[500]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              context,
              'Rs. ${walletAmount.toStringAsFixed(2)}',
              'Wallet',
            ),
          ),
          Container(
            width: 1,
            height: 100,
            color: Colors.grey[500],
          ),
          Expanded(
            child: _buildStatItem(
              context,
              orderCount.toString(),
              'Orders',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
