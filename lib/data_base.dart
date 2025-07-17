import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';





Future connectToDatabase() async {



  return await Connection.open(
    Endpoint(
      host: 'aws-0-ap-southeast-1.pooler.supabase.com',
      database: 'postgres',
      port: 5432,
      username: 'postgres.rfvaloxuxjvwkjmbtehy',
      password: '#Lungelo1992',

    ),

    settings: ConnectionSettings(sslMode: SslMode.require),
  );
}


// Future connectToDatabase() async {
//
//
//
//   return await Connection.open(
//     Endpoint(
//       host: 'postgresql-175316-0.cloudclusters.net',
//       database: 'dev',
//       port: 10020,
//       username: 'lungelo',
//       password: 'lungeloo',
//
//     ),

//
//     settings: ConnectionSettings(sslMode: SslMode.disable),
//   );
// }

// Future connectToDatabase() async {
//
//
//
//   return await Connection.open(
//     Endpoint(
//       host: 'postgresql-162347-0.cloudclusters.net',
//       database: 'khulekani',
//       port: 19998,
//       username: 'lungelo',
//       password: 'Lungelo1992',
//     ),
//
//     settings: ConnectionSettings(sslMode: SslMode.disable),
//   );
// }

// Future connectToDatabase()async {
//   return await Connection.open(
//     Endpoint(
//       host: 'salt.db.elephantsql.com',
//       database: 'hkguizkx',
//       username: 'hkguizkx',
//       password: 'QohZ0dmxE0O4vHYj-oK6kE2DBzRGt6D6',
//     ),
//     // The postgres server hosted locally doesn't have SSL by default. If you're
//     // accessing a postgres server over the Internet, the server should support
//     // SSL and you should swap out the mode with `SslMode.verifyFull`.
//     settings: ConnectionSettings(sslMode: SslMode.disable),
//   );
// }
