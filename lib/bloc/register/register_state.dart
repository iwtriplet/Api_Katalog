part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final RegisterResponseModel model;
  RegisterLoaded({
    required this.model,
  });
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError({
    required this.message,
  });
}
