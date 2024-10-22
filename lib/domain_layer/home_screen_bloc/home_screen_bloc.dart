import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stock_trade/domain_layer/home_screen_bloc/home_screen_event.dart';
import 'package:stock_trade/domain_layer/home_screen_bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<BottomBarSelectedEvent>((event, emit) {
      emit(BottomBarSelectedState(event.index));
    });
  }
}
