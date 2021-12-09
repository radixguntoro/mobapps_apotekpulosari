import 'package:apotik_pulosari/components/response/connection_screen.dart';
import 'package:apotik_pulosari/components/response/loading_screen.dart';
import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:apotik_pulosari/modules/utility/controllers/connection_controller.dart';
import 'package:apotik_pulosari/modules/utility/models/model_connection.dart';
// import 'package:apotik_pulosari/version.dart';
import 'package:apotik_pulosari/wrapper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ConnectionController _connectionController = Get.put(ConnectionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder (
      init: ConnectionController(),
      builder: (_) {
        Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
          // _connectionController.checkVersion(context);
          _connectionController.setStatus(result);
        });
        if (ModelConnection.resultNetwork == 'connected') {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('id')
            ],
            locale: Locale('id'),
            theme: ThemeData(
              primaryColor: ColorTheme.primary,
              indicatorColor: ColorTheme.primary,
              buttonTheme: ButtonThemeData(
                buttonColor: ColorTheme.primary,
              ),
              colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: ColorTheme.secondary,
                background: Colors.white,
                primary: ColorTheme.primary,
              ),
              textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Montserrat',
              ),
              fontFamily: 'Montserrat'
            ),
            // home: LoadingScreen(),
            home: Wrapper(),
          );
          // if (_.localVersion != _.storeVersion) {
          //     return GetMaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     localizationsDelegates: [
          //       GlobalMaterialLocalizations.delegate
          //     ],
          //     supportedLocales: [
          //       const Locale('en'),
          //       const Locale('id')
          //     ],
          //     locale: Locale('id'),
          //     theme: ThemeData(
          //       primaryColor: ColorTheme.primary,
          //       indicatorColor: ColorTheme.primary,
          //       buttonTheme: ButtonThemeData(
          //         buttonColor: ColorTheme.primary,
          //       ),
          //       colorScheme: Theme.of(context).colorScheme.copyWith(
          //         secondary: ColorTheme.secondary,
          //         background: Colors.white,
          //         primary: ColorTheme.primary,
          //       ),
          //       textTheme: Theme.of(context).textTheme.apply(
          //         fontFamily: 'Montserrat',
          //       ),
          //       fontFamily: 'Montserrat'
          //     ),
          //     home: Version(),
          //   );
          // } else {
          //   return GetMaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     localizationsDelegates: [
          //       GlobalMaterialLocalizations.delegate
          //     ],
          //     supportedLocales: [
          //       const Locale('en'),
          //       const Locale('id')
          //     ],
          //     locale: Locale('id'),
          //     theme: ThemeData(
          //       primaryColor: ColorTheme.primary,
          //       indicatorColor: ColorTheme.primary,
          //       buttonTheme: ButtonThemeData(
          //         buttonColor: ColorTheme.primary,
          //       ),
          //       colorScheme: Theme.of(context).colorScheme.copyWith(
          //         secondary: ColorTheme.secondary,
          //         background: Colors.white,
          //         primary: ColorTheme.primary,
          //       ),
          //       textTheme: Theme.of(context).textTheme.apply(
          //         fontFamily: 'Montserrat',
          //       ),
          //       fontFamily: 'Montserrat'
          //     ),
          //     // home: LoadingScreen(),
          //     home: Wrapper(),
          //   );
          // }
        } else if (ModelConnection.resultNetwork == 'disconnected') { 
          return MaterialApp(
            home: ConnectionScreen(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('id')
            ],
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primaryColor: ColorTheme.primary,
              indicatorColor: ColorTheme.primary,
              buttonTheme: ButtonThemeData(
                buttonColor: ColorTheme.primary,
              )
            ),
          );
        } else {
          return MaterialApp(
            home: LoadingScreen(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('id')
            ],
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primaryColor: ColorTheme.primary,
              indicatorColor: ColorTheme.primary,
              buttonTheme: ButtonThemeData(
                buttonColor: ColorTheme.primary,
              )
            ),
          );
        }
      }
    );
  }
}
