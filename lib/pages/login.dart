import 'package:caed/providers/login_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final loginState = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagem de fundo (parte superior)
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/plano_de_fundo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Logo CAEd
                  Image.asset(
                    'assets/logo.png',
                    width: screenWidth * 0.45,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),

                  // Campos de login
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Usuário',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) {
                            // Atualizar o email no LoginNotifier
                            ref.read(loginProvider.notifier).setEmail(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Senha',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            // Atualizar a senha no LoginNotifier
                            ref.read(loginProvider.notifier).setPassword(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botão de login fixado no rodapé com InkWell
          InkWell(
            onTap: () {
              ref.read(loginProvider.notifier).authenticate();

              // Verificar se o login foi bem-sucedido
              if (loginState.isAuthenticated) {
                // Navegar para a lista de pacotes se autenticado
                Navigator.of(context).pushNamed('/List');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login inválido')),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              width: double.infinity,
              color: Colors.yellow, // Cor amarela do rodapé
              child: const Center(
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
