part of 'owner_bloc.dart';

sealed class OwnerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class OwnerFetched extends OwnerEvent {}

final class OwnerRemoved extends OwnerEvent {
  final int id;

  OwnerRemoved(this.id);
}

// ignore: must_be_immutable
final class OwnerInsert extends OwnerEvent {
  Owner owner;

  OwnerInsert({required this.owner});
}
