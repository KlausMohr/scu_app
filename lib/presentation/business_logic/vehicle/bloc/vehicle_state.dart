part of 'vehicle_bloc.dart';

enum VehicleStatus { initial, success, failure }

final class VehicleState extends Equatable {
  const VehicleState({
    this.status = VehicleStatus.initial,
    this.vehicles = const <VehicleModel>[],
    this.lastRemovedVehicle,
  });

  final VehicleStatus status;
  final List<VehicleModel> vehicles;
  final int? lastRemovedVehicle;

  VehicleState copyWith({
    VehicleStatus? status,
    List<VehicleModel>? vehicles,
    int? Function()? lastRemovedVehicle,
  }) {
    return VehicleState(
        status: status ?? this.status,
        vehicles: vehicles ?? this.vehicles,
        lastRemovedVehicle: lastRemovedVehicle != null
            ? lastRemovedVehicle()
            : this.lastRemovedVehicle);
  }

  @override
  String toString() {
    return '''VehicleState { status: $status, lastRemovedVehicle: $lastRemovedVehicle, vehicles: ${vehicles.length}}''';
  }

  @override
  List<Object> get props => [status, vehicles];
}
