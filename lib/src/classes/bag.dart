import 'package:equatable/equatable.dart';

class Bag extends Equatable {
  final String? error;

  final bool passes;

  const Bag({
    this.error,
    this.passes = false,
  });

  factory Bag.empty() => const Bag();

  factory Bag.error(String error) => Bag(error: error);

  factory Bag.passes() => const Bag(passes: true);

  @override
  String toString() => 'Bug(error: $error, passes: $passes)';

  @override
  List<Object?> get props => [error, passes];
}
