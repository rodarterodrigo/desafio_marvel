import 'package:flutter_bloc/flutter_bloc.dart';

class SlideDotsBloc extends Bloc<int, int> {
  int index = 1000;

  SlideDotsBloc(this.index) : super(1000) {
    on<int>(_mapEventToState);
  }

  void _mapEventToState(int event, Emitter<int> emitter) async {
    emitter(index = event);
  }
}
