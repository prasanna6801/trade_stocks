import 'package:flutter/material.dart';
import "package:equatable/equatable.dart";
import 'package:stock_trade/data_layer/stock_model.dart';

@immutable
abstract class WatchlistState extends Equatable {}

class WatchlistInitial extends WatchlistState {
  WatchlistInitial();

  @override
  List<Object?> get props => [];
}

class WatchlistLoadedState extends WatchlistState {
  final List<StockModel> stocks;
  WatchlistLoadedState(this.stocks);
  @override
  bool operator ==(Object other) => false;
  @override
  List<Object?> get props => [];
}
