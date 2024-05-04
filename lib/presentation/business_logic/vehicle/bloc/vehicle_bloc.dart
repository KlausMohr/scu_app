import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scu_app/data/implementatios/vehicle_repository.dart';
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
    try {
      if (state.status == VehicleStatus.initial) {
        final vehicles = await vehicleRepo.getAll();
        return emit(state.copyWith(
          status: VehicleStatus.success,
          vehicles: vehicles,
        ));
      }
      final vehicles = await vehicleRepo.getAll();
      emit(state.copyWith(
        status: VehicleStatus.success,
        vehicles: List.of(state.vehicles)..addAll(vehicles),
      ));
    } catch (_) {
      emit(state.copyWith(status: VehicleStatus.failure));
    }
  }

  Future<void> _onVehicleRemoved(
    VehicleRemoved event,
    Emitter<VehicleState> emit,
  ) async {
    emit(state.copyWith(lastRemovedVehicle: () => event.id));
    await vehicleRepo.delete(event.id);
  }

  Future<void> _onVehicleInsert(
      VehicleInsert event, Emitter<VehicleState> emit) async {
    emit(state.copyWith());
    await vehicleRepo.insert(event.vehicle);
  }
}
