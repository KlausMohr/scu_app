import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scu_app/data/implementatios/repositories/vehicle_repository.dart';
import 'package:scu_app/data/models/vehicle_model.dart';
part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(const VehicleState()) {
    on<VehicleFetched>(_onVehicleFetched);
    on<VehicleRemoved>(_onVehicleRemoved);
    on<VehicleInsert>(_onVehicleInsert);
  }

  HttpVehicleRepository vehicleRepo = HttpVehicleRepository();

  Future<void> _onVehicleFetched(
      VehicleFetched event, Emitter<VehicleState> emit) async {
    if (state.status == VehicleStatus.initial) {
      final vehicles = await vehicleRepo.getAll();
      return emit(state.copyWith(
        status: VehicleStatus.success,
        vehicles: vehicles,
      ));
    }
    final vehicles = await vehicleRepo.getAll();
    emit(vehicles.isEmpty
        ? state.copyWith(
            status: VehicleStatus.success,
            vehicles: List.of(state.vehicles)..addAll(vehicles),
          )
        : state);
  }

  Future<void> _onVehicleRemoved(
    VehicleRemoved event,
    Emitter<VehicleState> emit,
  ) async {
    await vehicleRepo.delete(event.id);
    final vehicles = await vehicleRepo.getAll();
    emit(state.copyWith(status: VehicleStatus.success, vehicles: vehicles));
  }

  Future<void> _onVehicleInsert(
      VehicleInsert event, Emitter<VehicleState> emit) async {
    await vehicleRepo.insert(event.vehicle);
    final vehicles = await vehicleRepo.getAll();
    emit(state.copyWith(status: VehicleStatus.success, vehicles: vehicles));
  }
}
