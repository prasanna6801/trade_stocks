import 'package:flutter/material.dart';
import "package:equatable/equatable.dart";

@immutable
abstract class WatchlistEvent extends Equatable {}

class WatchlistLoadEvent extends WatchlistEvent {
  WatchlistLoadEvent();

  @override
  List<Object?> get props => [];
}
