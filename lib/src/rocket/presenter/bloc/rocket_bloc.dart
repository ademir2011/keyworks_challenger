import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyworkds_challenger/src/rocket/domain/usecases/get_next_four_rockets.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_event.dart';
import 'package:keyworkds_challenger/src/rocket/presenter/bloc/rocket_state.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  final GetNextFourRockets getNextFourRockets;

  RocketBloc(super.initialState, {required this.getNextFourRockets}) {
    on<GetNextFourRocketsEvent>(_getNextFourRocketsEvent);
  }

  void _getNextFourRocketsEvent(emit, event) async {
    emit(LoadingRocketState());
    try {
      final listRockets = await getNextFourRockets.getNextFourRockets();
      emit(SuccessRocketState(rocketsLaunch: listRockets));
    } catch (e) {
      emit(ErrorRocketState(message: 'Houve um problema no recebimento dos dados'));
    }
  }
}
