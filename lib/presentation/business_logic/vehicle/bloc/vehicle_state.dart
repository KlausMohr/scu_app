part of 'vehicle_bloc.dart';

enum VehicleStatus { initial, success, failure }

final class VehicleState extends Equatable {
  const VehicleState({
    this.status = VehicleStatus.initial,
    this.vehicles = const <VehicleModel>[],
  });

  final VehicleStatus status;
  final List<VehicleModel> vehicles;

  VehicleState copyWith({
    VehicleStatus? status,
    List<VehicleModel>? vehicles,
  }) {
    return VehicleState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
    );
  }

  @override
  String toString() {
    return '''VehicleState { status: $status, vehicles: ${vehicles.length}}''';
  }

  @override
  List<Object> get props => [status, vehicles];
}
