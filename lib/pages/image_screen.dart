import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'dart:async';
import 'package:khulekani_app/database.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:appwrite/appwrite.dart';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/providers/saved_pages.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;

  Future<String> upLoadImage(Asset image) async {
    try {
      AppWriteDataBase connect = AppWriteDataBase();
      var uuid = Uuid();
      var genId = uuid.v6();
      var forName = uuid.v4();

      final storage = connect.storage;

      ByteData byteData = await image.getByteData(quality: 15);
      List<int> imageData = byteData.buffer.asUint8List();

      // Replace 'file' with the file you want to upload
      final response = await storage.createFile(
        bucketId: '65c36455aabc9ae9dca0',
        fileId: genId,
        file: InputFile.fromBytes(
            bytes: imageData, filename: 'image$forName.jpg'),
        //permissions: ['any'],
      );

      // Check if the upload was successful
      if (response != null) {
        String imageId = response.$id;
        //final result = await storage.getFilePreview(bucketId:'65c36455aabc9ae9dca0',fileId: imageId);

        final img =
            'https://cloud.appwrite.io/v1/storage/buckets/65c36455aabc9ae9dca0/files/$imageId/view?project=65bc947456c1c0100060&mode=admin';
        // print(response.)
        print('THIS IS THE IMADE URL : $img');
        return img;
      } else {
        print('Failed to upload image: ${response.name}');
        return '';
      }
    } catch (error) {
      print('Error uploading image: $error');
      return '';
    }
  }

  //////////////////////////////////////////////////////////////////////////////////

  Future<void> _loadAssets() async {
    setState(() {
      isLoading = true;
    });

    print("Pressed");
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,
        materialOptions: const MaterialOptions(
          maxImages: 10,
          enableCamera: true,
          actionBarColor: Colors.blue,
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: true,
          selectCircleStrokeColor: Colors.grey,
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    List<String> urls = [];
    for (var item in resultList) {
      final url = await upLoadImage(item);
      urls.add(url);
    }

    while (urls.length < 10) {
      String blank =
          'https://learn.canva.com/wp-content/uploads/2014/10/whitespace.jpg';
      urls.add(blank);
    }

    if (!mounted) return;

    setState(() {
      imagez = urls;
      isLoading = false;
    });
  }

/////////////////////////////////////////////////////////////////////////////////
  // URL images...
  List<String> imagez = [];
  List<Asset> images = <Asset>[];

  void clear7() {
    setState(() {
      imagez = [];
    });

    print("cleared 7");
  }

  @override
  bool get wantKeepAlive => true;

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Column(
      children: [
        HeaderBlue(
          text: 'Pictures',
        ),
        SaveButton(
          text: 'Upload Images',
          onPressed: () async {
            await _loadAssets();
          },
        ),
        SaveButton(
          text: 'Save',
          color: context.watch<ProviderSavedSeven>().seven == false
              ? Colors.red
              : Colors.green[500],
          onPressed: () {
            void stuck() {
              if (imagez.length < 10) {
                Future<bool?> problem() {
                  return Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Alert!",
                    desc: "You must Select 10 images",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "okay",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                }

                problem();
              } else {
                context
                    .read<ProviderClear7>()
                    .setMyFunction(newFunction: clear7);
                context.read<ProviderSavedSeven>().changeValue(newValue: true);
                context.read<ProviderPictuers>().changeValue(newValue: imagez);
                Future<bool?> saveData() {
                  return Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Saved",
                    desc: "Your Data has been Saved.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Done",

                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      ),
                    ],
                  ).show();
                }

                saveData();
              }
            }

            stuck();
          },
        ),
        Container(
          // color: Colors.redAccent,
          height: h * 0.54,
          child: isLoading == true
              ? const Center(
                  child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator()))
              : GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: const [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: imagez.length,
                    (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: imagez[index],
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: CircularProgressIndicator(
                                value: 1.0,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                          //height: 250,
                          //width: double.maxFinite,
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
