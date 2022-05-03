import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String materialNumber;
  final String unit;
  final num quantity;

  CartItem({
    required this.materialNumber,
    required this.unit,
    required this.quantity,
  });

  @override
  List<Object> get props => [materialNumber, unit, quantity];

  @override
  String toString() =>
      'CartItem(materialNumber: $materialNumber, unit: $unit, quantity: $quantity)';

  CartItem copyWith({
    String? materialNumber,
    String? unit,
    num? quantity,
  }) {
    return CartItem(
      materialNumber: materialNumber ?? this.materialNumber,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
    );
  }
}
