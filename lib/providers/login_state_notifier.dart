import 'package:flutter_riverpod/flutter_riverpod.dart';

// Login State
class LoginState {
  final String email;
  final String password;
  final bool isAuthenticated;

  LoginState({
    required this.email,
    required this.password,
    required this.isAuthenticated,
  });

  LoginState copyWith(
      {String? email, String? password, bool? isAuthenticated}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier()
      : super(LoginState(email: '', password: '', isAuthenticated: false));

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<bool> authenticate() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return state.email == 'teste@teste.com' && state.password == '123456';
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});
