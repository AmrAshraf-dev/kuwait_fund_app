import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AliveCubitObserver extends BlocObserver {
  final Set<BlocBase> _aliveCubits = {};

  @override
  void onCreate(BlocBase bloc) {
    _aliveCubits.add(bloc);
    super.onCreate(bloc);
    if (kDebugMode) {
      log('[Cubit Created]: ${bloc.cubitName}');
      log('[Current Alive Cubits]: ${_aliveCubits.map((cubit) => cubit.cubitName).toList()}');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    _aliveCubits.remove(bloc);
    if (kDebugMode) {
      log('[Cubit Closed]: ${bloc.cubitName}');
      log('[Current Alive Cubits]: ${_aliveCubits.map((cubit) => cubit.cubitName).toList()}');
    }

    super.onClose(bloc);
  }
}

extension CubitObserverExtension on BlocBase {
  String get cubitName => '$runtimeType($hashCode)';
}
