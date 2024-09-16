import 'package:caed/app_rotas.dart';
import 'package:caed/utils/servico_navegacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  //Obrigatoriedade para que o APP só funcione no modo retrato

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) => runApp(const ProviderScope(child: App())));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          // Se o local do dispositivo não for suportado, use o primeiro da lista
          return supportedLocales.first;
        },
        routes: RotasNomeadas().routes,
        navigatorKey: ServicoNavegacao.navigatorKey,
      ),
    );
  }
}
