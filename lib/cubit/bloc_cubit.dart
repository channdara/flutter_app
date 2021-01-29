import 'package:flutter_app/cubit/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCubit extends Cubit<BlocState> {
  BlocCubit() : super(BlocStateInit());

  int _count = 0;

  int get count => _count;

  void dispose() {
    close();
  }

  void increment() {
    _count++;
    emit(BlocStateIncrement());
  }

  void decrement() {
    _count--;
    emit(BlocStateDecrement());
  }
}
