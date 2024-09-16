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

  // Método para copiar o estado e modificar valores específicos
  LoginState copyWith(
      {String? email, String? password, bool? isAuthenticated}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

// Login StateNotifier para gerenciar o estado do login
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier()
      : super(LoginState(email: '', password: '', isAuthenticated: false));

  // Função para atualizar o email
  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  // Função para atualizar a senha
  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  // Função para autenticar (mock)
  void authenticate() {
    if (state.email == 'teste@teste.com' && state.password == '123456') {
      state = state.copyWith(isAuthenticated: true);
    }
  }
}

// Criando o provider
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});
