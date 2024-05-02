import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scu_app/data/implementatios/vehicle_repository.dart';
import 'package:scu_app/data/models/vehicle_model.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(const VehicleState()) {
    on<VehicleFetched>(_onVehicleFetched);
  }

  HttpVehicleRepository vehicleRepo = HttpVehicleRepository();

  Future<void> _onVehicleFetched(
      VehicleFetched event, Emitter<VehicleState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == VehicleStatus.initial) {
        final vehicles = await vehicleRepo.getAll();
        return emit(state.copyWith(
          status: VehicleStatus.success,
          vehicles: vehicles,
          hasReachedMax: false,
        ));
      }
      final vehicles = await vehicleRepo.getAll();
      emit(vehicles.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: VehicleStatus.success,
              vehicles: List.of(state.vehicles)..addAll(vehicles),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: VehicleStatus.failure));
    }
  }
}
