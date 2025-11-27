import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- Total Balance Card --------
          const _BalanceCard(),
          const SizedBox(height: 18),

          // -------- Quick Actions --------
          Row(
            children: const [
              _HomeActionButton(
                icon: Icons.sync_alt,
                label: 'Transfer',
              ),
              SizedBox(width: 10),
              _HomeActionButton(
                icon: Icons.receipt_long_outlined,
                label: 'Pay Bills',
              ),
              SizedBox(width: 10),
              _HomeActionButton(
                icon: Icons.stacked_bar_chart_rounded,
                label: 'Invest',
              ),
            ],
          ),

          const SizedBox(height: 24),

          // -------- Recent Transactions Header --------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6A5AE0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // -------- Transaction List --------
          const _TransactionTile(
            icon: Icons.movie_outlined,
            iconBg: Color(0xFFF3F4F6),
            title: "Netflix Subscription",
            category: "Entertainment • Today",
            amount: "-\$19.99",
            isIncome: false,
          ),
          const SizedBox(height: 10),
          const _TransactionTile(
            icon: Icons.coffee_outlined,
            iconBg: Color(0xFFF3F4F6),
            title: "Coffee Shop",
            category: "Food & Drink • Today",
            amount: "-\$4.50",
            isIncome: false,
          ),
          const SizedBox(height: 10),
          const _TransactionTile(
            icon: Icons.attach_money,
            iconBg: Color(0xFFE0F2FE),
            title: "Salary Deposit",
            category: "Income • Yesterday",
            amount: "+\$3500.00",
            isIncome: true,
          ),
          const SizedBox(height: 10),
          const _TransactionTile(
            icon: Icons.shopping_cart_outlined,
            iconBg: Color(0xFFF3F4F6),
            title: "Grocery Store",
            category: "Shopping • Yesterday",
            amount: "-\$55.80",
            isIncome: false,
          ),
          const SizedBox(height: 10),
          const _TransactionTile(
            icon: Icons.shopping_bag_outlined,
            iconBg: Color(0xFFF3F4F6),
            title: "Amazon Purchase",
            category: "Shopping • 2 days ago",
            amount: "-\$120.45",
            isIncome: false,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// =================== BALANCE CARD ===================

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF6A5AE0),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A5AE0).withOpacity(0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row: "Total Balance" + icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total Balance",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.credit_card,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // amount
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "\$8,945",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Text(
                ".32",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // bottom row: savings + last 30 days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Savings: \$5,500",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Text(
                "Last 30 days: +\$300",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =================== ACTION BUTTON ===================

class _HomeActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HomeActionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: const Color(0xFF6A5AE0),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =================== TRANSACTION TILE ===================

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String category;
  final String amount;
  final bool isIncome;

  const _TransactionTile({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.category,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 22, color: Colors.grey[800]),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                category,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isIncome ? Colors.green : const Color(0xFFEF4444),
            ),
          ),
        ],
      ),
    );
  }
}
