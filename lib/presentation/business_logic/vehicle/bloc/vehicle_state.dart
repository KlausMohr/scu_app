part of 'vehicle_bloc.dart';

enum VehicleStatus { initial, success, failure }

final class VehicleState extends Equatable {
  const VehicleState({
    this.status = VehicleStatus.initial,
    this.vehicles = const <VehicleModel>[],
    this.hasReachedMax = false,
  });

  final VehicleStatus status;
  final List<VehicleModel> vehicles;
  final bool hasReachedMax;

  VehicleState copyWith({
    VehicleStatus? status,
    List<VehicleModel>? vehicles,
    bool? hasReachedMax,
  }) {
    return VehicleState(
        status: status ?? this.status,
        vehicles: vehicles ?? this.vehicles,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''VehicleState { status: $status, hasReachedMax: $hasReachedMax, vehicles: ${vehicles.length}}''';
  }

  @override
  List<Object> get props => [status, vehicles, hasReachedMax];
}
