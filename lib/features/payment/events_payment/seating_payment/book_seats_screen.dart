import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tazkarti/data/models/events_data/event_model.dart';
import 'package:tazkarti/features/payment/events_payment/seating_payment/seat_picker_widget.dart';
import 'package:tazkarti/providers/selected_even_provider.dart/selected_event_provider.dart';

class BookSeatsScreen extends StatelessWidget {
  const BookSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EventModel event = context.read<SelectedEventProvider>().event;
    final seating = event.seating;

    // SeatingModel stores categories cheapest-first.
    // We reverse so the most expensive category sits closest to the stage
    // (top rows) and the cheapest is furthest away (bottom rows).
    final reversedCategories = List.generate(
      seating.categories.length,
      (i) {
        final reversedIndex = seating.categories.length - 1 - i;
        return SeatCategoryModel(
          name: seating.categories[reversedIndex],
          price: seating.prices[reversedIndex].toDouble(),
          seatsPerRow: seating.numOfSeatsInRows?[reversedIndex] ?? 8,
          rows: seating.numOfRows?[reversedIndex] ?? 5,
          color: _categoryColor(reversedIndex, seating.categories.length),
        );
      },
    );

    return SeatPickerWidget(
      categories: reversedCategories,
      onCheckout: (selectedSeats) {
        debugPrint('Checkout with: $selectedSeats');
        // Navigate to payment screen, pass selectedSeats
      },
    );
  }

  /// Colors are assigned based on the original index (0 = cheapest → gold,
  /// 1 = next → dark red, etc.) so the color meaning stays consistent
  /// regardless of display order.
  Color _categoryColor(int originalIndex, int total) {
    const colors = [
      Color(0xFFD4AF37), // gold       – cheapest
      Color(0xFF8B1A4A), // dark red   – next
      Color(0xFF1A5276), // navy
      Color(0xFF1E8449), // green
      Color(0xFF6C3483), // purple
    ];
    return colors[originalIndex % colors.length];
  }
}
