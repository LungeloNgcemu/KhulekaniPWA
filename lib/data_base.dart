import 'package:postgres/postgres.dart';


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
