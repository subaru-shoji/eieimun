import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class MachikaneCubit extends Cubit<String> {
  MachikaneCubit({required this.counterCubit})
      : counterCubitSubscription = counterCubit.stream.listen((state) => _apply
          (state)),
        super('');

  final CounterCubit counterCubit;
  StreamSubscription counterCubitSubscription;

  void _apply(int count) {
    if (count % 15 == 0) {
      emit('ばばんばー');
    } else if (count % 3 == 0) {
      emit('えいえいむん');
    } else if (count % 2 == 0) {
      emit('えいえい');
    } else {
      emit('えい');
    }
  }

  @override
  Future<void> close() {
    counterCubitSubscription.cancel();
    return super.close();
  }
}
