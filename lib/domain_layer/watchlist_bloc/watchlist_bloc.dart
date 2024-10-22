import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_trade/data_layer/stock_model.dart';
import 'package:stock_trade/domain_layer/watchlist_bloc/watchlist_event.dart';
import 'package:stock_trade/domain_layer/watchlist_bloc/watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  List<StockModel> stocks = [];
  WatchlistBloc() : super(WatchlistInitial()) {
    on<WatchlistLoadEvent>((event, emit) {
      stocks = [
        StockModel("GOLD 26JUL 59500 CE", "MCX", "+23.50(8.54%)", 298.50, 0),
        StockModel("ACCELYA", "NSE", "+1.05(0.07%)", 1337.70, 0),
        StockModel("ACC", "BSE", "+27.20(1.53%)", 1795.20, 400),
        StockModel("ACC", "NSE", "+25.40(1.43%)", 1792.30, 400),
      ];
      stocks.shuffle(Random());
      emit(WatchlistLoadedState(stocks));
    });
  }
}
