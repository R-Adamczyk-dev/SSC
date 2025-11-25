import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  const Failure([this.message]);

  @override
  List<Object?> get props => [message];
}

// Błędy bazy danych
class DatabaseFailure extends Failure {
  const DatabaseFailure([String? message])
      : super(message ?? 'Błąd zapisu/odczytu bazy danych');
  @override
  List<Object?> get props => [message];
}

// Błędy sieci (na przyszłość)
class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
      : super(message ?? 'Brak połączenia z siecią');
  @override
  List<Object?> get props => [message];
}

// Błędy walidacji
class ValidationFailure extends Failure {
  const ValidationFailure([String? message])
      : super(message ?? 'Błąd walidacji danych');
  @override
  List<Object?> get props => [message];
}

// Błędy nieoczekiwane
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String? message])
      : super(message ?? 'Nieoczekiwany błąd');
  @override
  List<Object?> get props => [message];
}
