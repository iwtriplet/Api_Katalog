part of 'login_bloc.dart';


abstract class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final LoginRequestModel model;
  DoLoginEvent({
    required this.model,
  });
}
