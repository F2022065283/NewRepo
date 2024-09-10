import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState { Initial, Lost, Gained }

Connectivity _connectivity = Connectivity();
StreamSubscription? _streamSubscription;

class InternetCubit extends Cubit<InternetCubitState> {
  InternetCubit() : super(InternetCubitState.Initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetCubitState.Gained);
      } else {
        emit(InternetCubitState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
