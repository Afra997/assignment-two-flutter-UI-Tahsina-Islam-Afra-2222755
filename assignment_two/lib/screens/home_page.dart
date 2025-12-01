import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Define colors
  static const Color primaryColor = Color(0xFF5E39DC);
  static const Color secondaryColor = Color(0xFF6748D8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomHeader(),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Balance',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Balance Amount
                  const Text(
                    '\$8,945.52',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Savings and Last 30 Days Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Savings Text
                      const Text(
                        'Savings: \$5,500',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      // Last 30 Days Text
                      const Text(
                        'Last 30 days +\$300 →',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          //--- Action Buttons Row ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  icon: Icons.swap_horiz,
                  label: 'Transfer',
                  onTap: () {},
                ),

                _buildActionButton(
                  icon: Icons.receipt_long,
                  label: 'Pay Bills',
                  onTap: () {},
                ),

                _buildActionButton(
                  icon: Icons.trending_up,
                  label: 'Invest',
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Recent Transactions Header Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Transactions List
          Column(
            children: [
              _buildTransactionItem(
                icon: Icons.movie,
                iconColor: Colors.red,
                category: 'Entertainment',
                name: 'Netflix Subscription',
                date: 'Today',
                amount: '-\$19.99',
                isIncome: false,
              ),
              const Divider(indent: 16, endIndent: 16, height: 1),
              _buildTransactionItem(
                icon: Icons.coffee,
                iconColor: Colors.brown,
                category: 'Food & Drink',
                name: 'Coffee Shop',
                date: 'Today',
                amount: '-\$4.50',
                isIncome: false,
              ),
              const Divider(indent: 16, endIndent: 16, height: 1),
              _buildTransactionItem(
                icon: Icons.attach_money,
                iconColor: Colors.green,
                category: 'Income',
                name: 'Salary Deposit',
                date: 'Yesterday',
                amount: '+\$3500.00',
                isIncome: true,
              ),
              const Divider(indent: 16, endIndent: 16, height: 1),
              _buildTransactionItem(
                icon: Icons.shopping_cart,
                iconColor: Colors.blueGrey,
                category: 'Shopping',
                name: 'Grocery Store',
                date: 'Yesterday',
                amount: '-\$55.80',
                isIncome: false,
              ),
              const Divider(indent: 16, endIndent: 16, height: 1),
              _buildTransactionItem(
                icon: Icons.shopping_bag,
                iconColor: Colors.orange,
                category: 'Shopping',
                name: 'Amazon Purchase',
                date: '2 days ago',
                amount: '-\$120.45',
                isIncome: false,
              ),

              const SizedBox(height: 80),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconColor,
    required String category,
    required String name,
    required String date,
    required String amount,
    required bool isIncome,
  }) {
    final amountColor = isIncome ? Colors.green : Colors.red.shade700;

    final displayAmount = amount.replaceAll(RegExp(r'[+\-]'), '');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Icon Container
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 15),
              // Name and Category/Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$category · $date',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          // Right side: Amount
          Text(
            displayAmount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Icon Container (The light purple circle inside the button)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: primaryColor, size: 24),
            ),
            const SizedBox(height: 8),
            // Label Text
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
