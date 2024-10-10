import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'world_view.dart';
import 'package:postgres/postgres.dart';
import 'data_base.dart';
import 'package:provider/provider.dart';
import 'providers/provider_answers.dart';
import 'pages/splash_screen.dart';
import 'sample.dart';
import 'not_google.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'package:khulekani_app/providers/saved_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


// const supabaseUrl = 'https://xritndwmdbbjeqcocsnr.supabase.co';
// const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

// Future<void> main() async {
//   await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
//   runApp(MyApp());
// }

//https://stackoverflow.com/questions/51806662/how-to-set-landscape-orientation-mode-for-flutter-app
void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://xritndwmdbbjeqcocsnr.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhyaXRuZHdtZGJiamVxY29jc25yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNjMyOTIsImV4cCI6MjAzMzYzOTI5Mn0.uKMbFyn-En4cUe4hC_Ga4R3UofbkMZkQBuOQZES40L0");

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderOne()),
        ChangeNotifierProvider(create: (context) => ProviderTwo()),
        ChangeNotifierProvider(create: (context) => ProviderThree()),
        ChangeNotifierProvider(create: (context) => ProviderFour()),
        ChangeNotifierProvider(create: (context) => ProviderFive()),
        ChangeNotifierProvider(create: (context) => ProviderSix()),
        ChangeNotifierProvider(create: (context) => ProviderSeven()),
        ChangeNotifierProvider(create: (context) => ProviderEight()),
        ChangeNotifierProvider(create: (context) => ProviderNine()),
        ChangeNotifierProvider(create: (context) => ProviderTen()),
        ChangeNotifierProvider(create: (context) => ProviderEleven()),
        ChangeNotifierProvider(create: (context) => ProviderTwelve()),
        ChangeNotifierProvider(create: (context) => ProviderThirteen()),
        ChangeNotifierProvider(create: (context) => ProviderFourteen()),
        ChangeNotifierProvider(create: (context) => ProviderFifteen()),
        ChangeNotifierProvider(create: (context) => ProviderSixteen()),
        ChangeNotifierProvider(create: (context) => ProviderSeventeen()),
        ChangeNotifierProvider(create: (context) => ProviderEighteen()),
        ChangeNotifierProvider(create: (context) => ProviderNineteen()),
        ChangeNotifierProvider(create: (context) => ProviderTwenty()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyOne()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyThree()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyFour()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyFive()),
        ChangeNotifierProvider(create: (context) => ProviderTwentySix()),
        ChangeNotifierProvider(create: (context) => ProviderTwentySeven()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyEight()),
        ChangeNotifierProvider(create: (context) => ProviderTwentyNine()),
        ChangeNotifierProvider(create: (context) => ProviderThirty()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyOne()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyThree()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyFour()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyFive()),
        ChangeNotifierProvider(create: (context) => ProviderThirtySix()),
        ChangeNotifierProvider(create: (context) => ProviderThirtySeven()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyEight()),
        ChangeNotifierProvider(create: (context) => ProviderThirtyNine()),
        ChangeNotifierProvider(create: (context) => ProviderForty()),
        ChangeNotifierProvider(create: (context) => ProviderFortyOne()),
        ChangeNotifierProvider(create: (context) => ProviderFortyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderFortyThree()),
        ChangeNotifierProvider(create: (context) => ProviderFortyFour()),
        ChangeNotifierProvider(create: (context) => ProviderFortyFive()),
        ChangeNotifierProvider(create: (context) => ProviderFortySix()),
        ChangeNotifierProvider(create: (context) => ProviderFortySeven()),
        ChangeNotifierProvider(create: (context) => ProviderFortyEight()),
        ChangeNotifierProvider(create: (context) => ProviderFortyNine()),
        ChangeNotifierProvider(create: (context) => ProviderFifty()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyOne()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyThree()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyFour()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyFive()),
        ChangeNotifierProvider(create: (context) => ProviderFiftySix()),
        ChangeNotifierProvider(create: (context) => ProviderFiftySeven()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyEight()),
        ChangeNotifierProvider(create: (context) => ProviderFiftyNine()),
        ChangeNotifierProvider(create: (context) => ProviderSixty()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyOne()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyThree()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyFour()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyFive()),
        ChangeNotifierProvider(create: (context) => ProviderSixtySix()),
        ChangeNotifierProvider(create: (context) => ProviderSixtySeven()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyEight()),
        ChangeNotifierProvider(create: (context) => ProviderSixtyNine()),
        ChangeNotifierProvider(create: (context) => ProviderSeventy()),
        ChangeNotifierProvider(create: (context) => ProviderSeventyOne()),
        ChangeNotifierProvider(create: (context) => ProviderSeventyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderSeventyThree()),
        ChangeNotifierProvider(create: (context) => ProviderSeventyFour()),
        ChangeNotifierProvider(create: (context) => ProviderSeventyFive()),
        ChangeNotifierProvider(create: (context) => ProviderSeventySix()),
        ChangeNotifierProvider(create: (context) => ProviderSeventySeven()),
        // ChangeNotifierProvider(create: (context) => ProviderSeventyEight()),
        // ChangeNotifierProvider(create: (context) => ProviderSeventyNine()),
        ChangeNotifierProvider(create: (context) => ProviderEighty()),
        //////////////////////////////////////////////////////////////////////
        ChangeNotifierProvider(create: (context) => ProviderEightyOne()),
        ChangeNotifierProvider(create: (context) => ProviderEightyTwo()),
        ChangeNotifierProvider(create: (context) => ProviderEightyThree()),
        ChangeNotifierProvider(create: (context) => ProviderEightyFour()),
        //////////////////////////////////////////////////////////////////////////////
        ChangeNotifierProvider(create: (context) => ProviderClear1()),
        ChangeNotifierProvider(create: (context) => ProviderClear2()),
        ChangeNotifierProvider(create: (context) => ProviderClear3()),
        ChangeNotifierProvider(create: (context) => ProviderClear4()),
        ChangeNotifierProvider(create: (context) => ProviderClear5()),
        ChangeNotifierProvider(create: (context) => ProviderClear6()),
        ChangeNotifierProvider(create: (context) => ProviderClear7()),
        //
        ChangeNotifierProvider(create: (context) => ProviderClear8()),

        /////////////////////////////////////////////////////////////////////////////
        ChangeNotifierProvider(create: (context) => ProviderSavedOne()),
        ChangeNotifierProvider(create: (context) => ProviderSavedTwo()),
        ChangeNotifierProvider(create: (context) => ProviderSavedThree()),
        ChangeNotifierProvider(create: (context) => ProviderSavedFour()),
        ChangeNotifierProvider(create: (context) => ProviderSavedFive()),
        ChangeNotifierProvider(create: (context) => ProviderSavedSix()),
        //
        ChangeNotifierProvider(create: (context) => ProviderSavedSeven()),
        ChangeNotifierProvider(create: (context) => ProviderSavedEight()),
        ChangeNotifierProvider(create: (context) => ProviderSavedNine()),
        //////////////////////////////////////////////////////////////////////////////
        ChangeNotifierProvider(create: (context) => ProviderPictuers()),
        ChangeNotifierProvider(create: (context) => ProviderNotes()),

        ChangeNotifierProvider(create: (context) => ProviderIsDetails()),
        ChangeNotifierProvider(create: (context) => TableListProvider()),

      ],
      child: MaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        debugShowCheckedModeBanner: false,
        title: 'DISASTER MANAGEMENT INCIDENT ASSESSMENT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
