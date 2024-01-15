part of '../cubit/cubit.dart';

sealed class TodoState {}

class InitialState extends TodoState {}

class LoadingState extends TodoState {}

class ErrorState extends TodoState {
  final String message;
  ErrorState({required this.message});
}

class LoadedState extends TodoState {
  List<PostModel> list;
  LoadedState({required this.list});
}
