import 'package:flutter_app/cubit/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCubit extends Cubit<BlocState> {
  BlocCubit() : super(BlocStateInit());

  int count = 0;

  void increment() {
    count++;
    emit(BlocStateIncrement());
  }

  void decrement() {
    count--;
    emit(BlocStateDecrement());
  }
}
