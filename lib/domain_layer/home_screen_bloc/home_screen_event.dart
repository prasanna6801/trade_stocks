import 'package:flutter/material.dart';
import "package:equatable/equatable.dart";

@immutable
abstract class HomeScreenEvent extends Equatable {}

class BottomBarSelectedEvent extends HomeScreenEvent {
  final int index;
  BottomBarSelectedEvent(this.index);

  @override
  List<Object?> get props => [];
}
