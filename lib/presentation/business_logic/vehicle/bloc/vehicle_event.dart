part of 'vehicle_bloc.dart';

sealed class VehicleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class VehicleFetched extends VehicleEvent {}

final class VehicleRemoved extends VehicleEvent {
  VehicleRemoved(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

// ignore: must_be_immutable
final class VehicleInsert extends VehicleEvent {
  VehicleModel vehicle;

  VehicleInsert({required this.vehicle});
}
