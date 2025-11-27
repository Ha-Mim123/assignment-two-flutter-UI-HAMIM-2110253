import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          const Text(
            "Monthly Spending Report",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),

          // ------------ Total Expenses Card ------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Expenses (Last 30 days)",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "-\$1270.00",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDC2626), // red
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE2E2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.arrow_upward,
                        size: 16,
                        color: Color(0xFFDC2626),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Up 12% from last month",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFDC2626),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ------------ Spending Breakdown Card ------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Spending Breakdown",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),

                _SpendingRow(
                  label: "Food & Drink",
                  amount: "\$450.00 (35%)",
                  value: 0.35,
                  color: Color(0xFFEF4444), // red
                ),
                SizedBox(height: 12),

                _SpendingRow(
                  label: "Shopping",
                  amount: "\$320.00 (25%)",
                  value: 0.25,
                  color: Color(0xFF6366F1), // purple/indigo
                ),
                SizedBox(height: 12),

                _SpendingRow(
                  label: "Housing",
                  amount: "\$280.00 (22%)",
                  value: 0.22,
                  color: Color(0xFFF59E0B), // amber
                ),
                SizedBox(height: 12),

                _SpendingRow(
                  label: "Transport",
                  amount: "\$150.00 (12%)",
                  value: 0.12,
                  color: Color(0xFF22C55E), // green
                ),
                SizedBox(height: 12),

                _SpendingRow(
                  label: "Other",
                  amount: "\$70.00 (6%)",
                  value: 0.06,
                  color: Color(0xFF9CA3AF), // grey
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ============== SINGLE SPENDING ROW ==============

class _SpendingRow extends StatelessWidget {
  final String label;
  final String amount;
  final double value; // 0.0 - 1.0
  final Color color;

  const _SpendingRow({
    required this.label,
    required this.amount,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: const Color(0xFFE5E7EB),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
