import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

Future connectToDatabase()async {
  return await Connection.open(
    Endpoint(
      host: 'salt.db.elephantsql.com',
      database: 'hkguizkx',
      username: 'hkguizkx',
      password: 'QohZ0dmxE0O4vHYj-oK6kE2DBzRGt6D6',
    ),
    // The postgres server hosted locally doesn't have SSL by default. If you're
    // accessing a postgres server over the Internet, the server should support
    // SSL and you should swap out the mode with `SslMode.verifyFull`.
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
}