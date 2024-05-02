part of 'vehicle_bloc.dart';

sealed class VehicleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class VehicleFetched extends VehicleEvent {}
