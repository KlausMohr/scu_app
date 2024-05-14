part of 'owner_bloc.dart';

enum OwnerStatus { initial, success, failure }

final class OwnerState extends Equatable {
  const OwnerState({
    this.status = OwnerStatus.initial,
    this.owners = const <Owner>[],
  });

  final OwnerStatus status;
  final List<Owner> owners;

  OwnerState copyWith({
    OwnerStatus? status,
    List<Owner>? owners,
  }) {
    return OwnerState(
      status: status ?? this.status,
      owners: owners ?? this.owners,
    );
  }

  @override
  String toString() {
    return '''OwnerState { status: $status, owners: ${owners.length}}''';
  }

  @override
  List<Object> get props => [status, owners];
}
