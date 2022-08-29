import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  var connectivityResult = (Connectivity().checkConnectivity());
  StreamSubscription? subscription;

  InternetCubit() : super(InternetInitial()) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        emit(InternetGainedState());
      } else {
        emit(InternetLostState());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
