import 'package:flutter/material.dart';

class PricesTableWidget extends StatelessWidget {
  final Map<String, num> categoriesPrices;
  final String currencyLabel;

  const PricesTableWidget({
    super.key,
    required this.categoriesPrices,
    this.currencyLabel = 'EGP',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Row
          _buildHeaderRow(),
          // Data Rows
          ...categoriesPrices.entries.map(
            (entry) => _buildDataRow(
              entry.key,
              '${entry.value} $currencyLabel',
              isLast: entry.key == categoriesPrices.keys.last,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF4CAF50),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              alignment: Alignment.center,
              child: const Text(
                'CATEGORY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        Container(width: 1, color: Colors.black),
          Expanded(
            child: Container(
              color: const Color(0xFF4CAF50),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              alignment: Alignment.center,
              child: const Text(
                'PRICE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String category, String price, {bool isLast = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: Colors.black,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Container(width: 1, color: Colors.black),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
