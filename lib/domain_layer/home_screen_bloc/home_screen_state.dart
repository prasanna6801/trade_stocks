import 'package:flutter/material.dart';
import "package:equatable/equatable.dart";

@immutable
abstract class HomeScreenState extends Equatable {}

class HomeScreenInitial extends HomeScreenState {
  HomeScreenInitial();

  @override
  List<Object?> get props => [];
}

class BottomBarSelectedState extends HomeScreenState {
  final int index;
  BottomBarSelectedState(this.index);
  @override
  bool operator ==(Object other) => false;
  @override
  List<Object?> get props => [];
  
}
