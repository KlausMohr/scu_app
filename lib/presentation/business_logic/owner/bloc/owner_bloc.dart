import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scu_app/data/implementatios/repositories/owner_repository.dart';
import 'package:scu_app/data/models/owner_model.dart';

part 'owner_event.dart';
part 'owner_state.dart';

class OwnerBloc extends Bloc<OwnerEvent, OwnerState> {
  OwnerBloc() : super(const OwnerState()) {
    on<OwnerFetched>(_onOwnerFetched);
    on<OwnerRemoved>(_onOwnerRemoved);
    on<OwnerInsert>(_onOwnerInsert);
  }

  OwnerRepository ownerRepo = OwnerRepository();

  Future<void> _onOwnerFetched(
      OwnerFetched event, Emitter<OwnerState> emit) async {
    if (state.status == OwnerStatus.initial) {
      final vehicles = await ownerRepo.getAll();
      return emit(state.copyWith(
        status: OwnerStatus.success,
        owners: vehicles,
      ));
    }
    final owners = await ownerRepo.getAll();
    emit(owners.isEmpty
        ? state.copyWith(
            status: OwnerStatus.success,
            owners: List.of(state.owners)..addAll(owners),
          )
        : state);
  }

  Future<void> _onOwnerRemoved(
    OwnerRemoved event,
    Emitter<OwnerState> emit,
  ) async {
    await ownerRepo.delete(event.id);
    final vehicles = await ownerRepo.getAll();
    emit(state.copyWith(status: OwnerStatus.success, owners: vehicles));
  }

  Future<void> _onOwnerInsert(
      OwnerInsert event, Emitter<OwnerState> emit) async {
    await ownerRepo.insert(event.owner);
    final vehicles = await ownerRepo.getAll();
    emit(state.copyWith(status: OwnerStatus.success, owners: vehicles));
  }
}
