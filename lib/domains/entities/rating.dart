import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  double? rate;
  int? count;

  Rating({
    required this.rate,
    required this.count,
  });

  Rating copyWith({
    double? newRate,
    int? newCount,
  }) =>
      Rating(
        rate: newRate,
        count: newCount,
      );

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
