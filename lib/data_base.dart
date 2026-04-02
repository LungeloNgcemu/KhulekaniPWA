import 'package:postgres/postgres.dart';


Future connectToDatabase() async {



  return await Connection.open(
    Endpoint(
      host: 'aws-1-eu-west-2.pooler.supabase.com',
      database: 'postgres',
      port: 6543,
      username: 'postgres.ffvwhdjmwyypewyyypjp',
      password: '#Lungelo1992',

    ),

    settings: ConnectionSettings(sslMode: SslMode.require),
  );
}


