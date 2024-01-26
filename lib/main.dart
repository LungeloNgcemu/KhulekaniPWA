import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'world_view.dart';
import 'package:postgres/postgres.dart';
import 'data_base.dart';
import 'package:provider/provider.dart';
import 'provider_answers.dart';

//https://stackoverflow.com/questions/51806662/how-to-set-landscape-orientation-mode-for-flutter-app
void main() async {
 final  conn = await connectToDatabase();
  print('has connection!');

  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (context) => ProviderSeventyEight()),
        ChangeNotifierProvider(create: (context) => ProviderSeventyNine()),
        ChangeNotifierProvider(create: (context) => ProviderEighty()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DISASTER MANAGEMENT INCIDENT ASSESSMENT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WorldView(),
      ),
    );
  }
}

