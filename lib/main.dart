import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
   
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
 ],
  supportedLocales: [
      const Locale('en'), // English
      const Locale('es'), // Hebrew
  ],
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){

        print('Ruta llamada: ${ settings.name}' );

        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage() 
          );

      },
      
    );
  }
}