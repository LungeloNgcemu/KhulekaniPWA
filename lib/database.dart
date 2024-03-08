import 'package:appwrite/appwrite.dart';
import 'package:uuid/uuid.dart';
import 'package:appwrite/models.dart';


class AppWriteDataBase {
  late Client client;
  late Account account;
  late Databases databases;
  late Realtime realtime;
  late Storage storage;

  AppWriteDataBase() {
    try {
      client = Client();
      client
          .setEndpoint('https://cloud.appwrite.io/v1')
          .setProject('65bc947456c1c0100060')
          .setSelfSigned(status: true);
      account = Account(client);
      databases = Databases(client);
      realtime = Realtime(client);
      storage = Storage(client);



      print("connected to DB");
    } catch (error) {
      print(error);
    }
  }


  // Future<void> postData(String data,String key) async {
  //   try {
  //     await databases.createDocument(
  //       databaseId: '65bc96e01083968a6a01',
  //       documentId: '65c353b249f905c91da0',
  //       collectionId: '65c3535032fa757ef5f4',
  //       data: { key: data},
  //     );
  //     print('Data posted successfully');
  //   } catch (error) {
  //     print('Error posting data: $error');
  //   }
  // }
}
