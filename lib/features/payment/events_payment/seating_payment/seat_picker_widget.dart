import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazkarti/core/colors/colors.dart';

// ─── Model ────────────────────────────────────────────────────────────────────

class SeatCategoryModel {
  final String name;
  final double price;
  final int seatsPerRow;
  final int rows;
  final Color color;

  const SeatCategoryModel({
    required this.name,
    required this.price,
    required this.seatsPerRow,
    required this.rows,
    required this.color,
  });
}

// ─── Internal seat state ──────────────────────────────────────────────────────

class _Seat {
  final String id;
  final String category;
  final double price;
  final bool isAvailable;
  bool isSelected;

  _Seat({
    required this.id,
    required this.category,
    required this.price,
    required this.isAvailable,
    this.isSelected = false,
  });
}

// ─── Widget ───────────────────────────────────────────────────────────────────

class SeatPickerWidget extends StatefulWidget {
  final List<SeatCategoryModel> categories;
  final void Function(List<Map<String, dynamic>> selectedSeats) onCheckout;

  const SeatPickerWidget({
    super.key,
    required this.categories,
    required this.onCheckout,
  });

  @override
  State<SeatPickerWidget> createState() => _SeatPickerWidgetState();
}

class _SeatPickerWidgetState extends State<SeatPickerWidget> {
  late List<List<List<_Seat>>> _grid;
  late List<String> _rowLabels;

  final TransformationController _transformController =
      TransformationController();
  double _scale = 1.0;
  bool _fitApplied = false;

  static const double _minScale = 0.3;
  static const double _maxScale = 3.0;

  // All dot / spacing sizes via ScreenUtil getters
  double get _dotSize => 13.r;
  double get _dotMargin => 2.r;
  double get _aisleWidth => 14.w;
  double get _rowLabelWidth => 16.w;
  double get _mapPadding => 10.w;

  @override
  void initState() {
    super.initState();
    _buildGrid();
  }

  void _buildGrid() {
    _grid = [];
    _rowLabels = [];
    int rowIndex = 0;
    for (final cat in widget.categories) {
      for (int r = 0; r < cat.rows; r++) {
        final label = String.fromCharCode(65 + rowIndex);
        _rowLabels.add(label);
        final left = List.generate(
          cat.seatsPerRow,
          (i) => _Seat(
            id: '$label-${i + 1}',
            category: cat.name,
            price: cat.price,
            isAvailable: true,
          ),
        );
        final right = List.generate(
          cat.seatsPerRow,
          (i) => _Seat(
            id: '$label-${cat.seatsPerRow + i + 1}',
            category: cat.name,
            price: cat.price,
            isAvailable: true,
          ),
        );
        _grid.add([left, right]);
        rowIndex++;
      }
    }
  }

  int get _maxSeatsPerRow =>
      widget.categories.map((c) => c.seatsPerRow).reduce((a, b) => a > b ? a : b);

  // Natural pixel width of one seat row (for computing fit scale)
  double _rowNaturalWidth(int seatsPerRow) =>
      _rowLabelWidth +
      seatsPerRow * (_dotSize + _dotMargin * 2) +
      _aisleWidth +
      seatsPerRow * (_dotSize + _dotMargin * 2) +
      _rowLabelWidth;

  // Scale so widest row fits exactly inside containerWidth
  double _fitScale(double containerWidth) {
    final naturalWidth = _rowNaturalWidth(_maxSeatsPerRow) + _mapPadding * 2;
    final fit = containerWidth / naturalWidth;
    return fit.clamp(_minScale, 1.0);
  }

  List<_Seat> get _selectedSeats => _grid
      .expand((row) => row.expand((s) => s))
      .where((s) => s.isSelected)
      .toList();

  double get _totalPrice =>
      _selectedSeats.fold(0.0, (sum, s) => sum + s.price);

  Color _categoryColor(String name) => widget.categories
      .firstWhere((c) => c.name == name, orElse: () => widget.categories.first)
      .color;

  void _toggleSeat(_Seat seat) {
    if (!seat.isAvailable) return;
    setState(() => seat.isSelected = !seat.isSelected);
  }

  void _removeSeat(_Seat seat) => setState(() => seat.isSelected = false);

  void _deleteSelected() => setState(() {
        for (final s in _selectedSeats.toList()) s.isSelected = false;
      });

  void _zoom(double delta) {
    final newScale = (_scale + delta).clamp(_minScale, _maxScale);
    final Matrix4 m = _transformController.value.clone();
    m.scale(newScale / _scale, newScale / _scale);
    _transformController.value = m;
    _scale = newScale;
  }

  void _pan(double dx, double dy) {
    final Matrix4 m = _transformController.value.clone();
    m.translate(dx, dy);
    _transformController.value = m;
  }

  void _reset() {
    _transformController.value = Matrix4.identity();
    _scale = 1.0;
    _fitApplied = false; // allow re-fit on next build
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedSeats;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Title ──────────────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 2.h),
              child: Text(
                'Choose Seats',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // ── Legend ─────────────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              child: Row(
                children: [
                  Text('Seat map',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  SizedBox(width: 10.w),
                  _legendItem(
                      color: const Color(0xFF2563EB), label: 'Your Seat'),
                  SizedBox(width: 10.w),
                  _legendItem(
                      color: Colors.grey.shade400, label: 'Unavailable'),
                ],
              ),
            ),

            // ── Controls ───────────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              child: Row(
                children: [
                  _ctrlBtn(Icons.add, () => _zoom(0.2)),
                  _ctrlBtn(Icons.remove, () => _zoom(-0.2)),
                  _ctrlBtn(Icons.arrow_upward, () => _pan(0, 60)),
                  _ctrlBtn(Icons.arrow_downward, () => _pan(0, -60)),
                  _ctrlBtn(Icons.arrow_back, () => _pan(60, 0)),
                  _ctrlBtn(Icons.arrow_forward, () => _pan(-60, 0)),
                  _ctrlBtn(Icons.refresh, _reset),
                ],
              ),
            ),

            // ── Seat map ───────────────────────────────────────────────────
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                // Apply fit scale once so the map doesn't overflow on load
                if (!_fitApplied) {
                  final fit = _fitScale(constraints.maxWidth);
                  if (fit < 1.0) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (!mounted) return;
                      setState(() {
                        _transformController.value =
                            Matrix4.identity()..scale(fit, fit);
                        _scale = fit;
                        _fitApplied = true;
                      });
                    });
                  } else {
                    _fitApplied = true;
                  }
                }

                return Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InteractiveViewer(
                    transformationController: _transformController,
                    minScale: _minScale,
                    maxScale: _maxScale,
                    // allow panning beyond edges freely
                    boundaryMargin: EdgeInsets.all(double.infinity),
                    // content is not constrained to box — it is its natural size
                    constrained: false,
                    onInteractionUpdate: (_) {
                      _scale =
                          _transformController.value.getMaxScaleOnAxis();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(_mapPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Stage bar
                          SizedBox(
                            width: _rowNaturalWidth(_maxSeatsPerRow),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              margin: EdgeInsets.only(bottom: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.music_note,
                                      size: 11.r,
                                      color: Colors.grey.shade600),
                                  SizedBox(width: 3.w),
                                  Text('Stage',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                          // Rows
                          ..._grid.asMap().entries.map(
                                (e) => _buildRow(
                                    _rowLabels[e.key], e.value[0], e.value[1]),
                              ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),

            // ── Delete Selected ────────────────────────────────────────────
            if (selected.isNotEmpty)
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _deleteSelected,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade500,
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.w, vertical: 7.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                    ),
                    child: Text('Delete Selected',
                        style:
                            TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ),
                ),
              ),

            // ── Selected seats list ────────────────────────────────────────
            if (selected.isNotEmpty)
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 120.h),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  itemCount: selected.length,
                  itemBuilder: (_, i) => _selectedSeatTile(selected[i]),
                ),
              ),

            // ── Total bar ──────────────────────────────────────────────────
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              padding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Text('Total  ',
                      style: TextStyle(
                          fontSize: 13.sp, color: Colors.black54)),
                  Text('${selected.length}',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  const Spacer(),
                  Text(
                    'EGP${_totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),

            // ── Proceed to Checkout ────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 8.h),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selected.isEmpty
                      ? null
                      : () => widget.onCheckout(selected
                          .map((s) => {
                                'id': s.id,
                                'category': s.category,
                                'price': s.price,
                              })
                          .toList()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  ColorsManeger.green,
                    disabledBackgroundColor: Colors.grey.shade400,
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    elevation: 0,
                  ),
                  child: Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),

            // ── Back ───────────────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.only(left: 14.w, bottom: 6.h),
              child: GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back,
                        size: 15.r, color: Colors.black87),
                    SizedBox(width: 4.w),
                    Text('Back',
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.black87)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Row ──────────────────────────────────────────────────────────────────

  Widget _buildRow(String label, List<_Seat> left, List<_Seat> right) {
    // Fixed width for each half based on the widest category
    final halfWidth = _maxSeatsPerRow * (_dotSize + _dotMargin * 2);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _rowLabelWidth,
            child: Text(label,
                style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600)),
          ),
          // Left half — centered in fixed width
          SizedBox(
            width: halfWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: left.map(_seatDot).toList(),
            ),
          ),
          SizedBox(width: _aisleWidth),
          // Right half — centered in fixed width
          SizedBox(
            width: halfWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: right.map(_seatDot).toList(),
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: _rowLabelWidth,
            child: Text(label,
                style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _seatDot(_Seat seat) {
    final Color color;
    Widget? child;

    if (!seat.isAvailable) {
      color = Colors.grey.shade400;
    } else if (seat.isSelected) {
      color = const Color(0xFF2563EB);
      child = Icon(Icons.check, size: 8.r, color: Colors.white);
    } else {
      color = _categoryColor(seat.category);
    }

    return GestureDetector(
      onTap: () => _toggleSeat(seat),
      child: Container(
        width: _dotSize,
        height: _dotSize,
        margin: EdgeInsets.all(_dotMargin),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: child != null ? Center(child: child) : null,
      ),
    );
  }

  // ── Selected tile ─────────────────────────────────────────────────────────

  Widget _selectedSeatTile(_Seat seat) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: const Color(0xFF8B1A4A),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            width: 16.r,
            height: 16.r,
            decoration: BoxDecoration(
              color: _categoryColor(seat.category),
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          SizedBox(width: 9.w),
          Text(seat.category,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(seat.id,
              style: TextStyle(color: Colors.white70, fontSize: 11.sp)),
          SizedBox(width: 10.w),
          Text('EGP${seat.price.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold)),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => _removeSeat(seat),
            child: Icon(Icons.delete_outline,
                color: Colors.white70, size: 16.r),
          ),
        ],
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Widget _ctrlBtn(IconData icon, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 4.w),
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Icon(icon, size: 15.r, color: Colors.black54),
        ),
      );

  Widget _legendItem({required Color color, required String label}) => Row(
        children: [
          Container(
            width: 13.r,
            height: 13.r,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: color == const Color(0xFF2563EB)
                ? Icon(Icons.check, size: 9.r, color: Colors.white)
                : null,
          ),
          SizedBox(width: 4.w),
          Text(label,
              style: TextStyle(fontSize: 11.sp, color: Colors.black54)),
        ],
      );

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }
}
