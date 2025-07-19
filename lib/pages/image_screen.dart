import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:khulekani_app/components/header_blue.dart';
import 'package:khulekani_app/components/save_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:async';
import 'package:khulekani_app/providers/provider_answers.dart';
import 'package:provider/provider.dart';
import 'package:khulekani_app/providers/saved_pages.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:khulekani_app/providers/clear_function.dart';
import 'dart:convert';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  
  List<String> imagez = [];
  List<Uint8List> resultList = [];
  List<String> urls = [];

  Future<String> upLoadImage(Uint8List image) async {
    try {
      String base64Image = base64Encode(image);

      print('THIS IS THE BASE64 STRING: $base64Image');

      return base64Image;
    } catch (error) {
      print('Error converting image to base64: $error');
      return '';
    }
  }

  Future<void> _loadAssets() async {
    setState(() {
      isLoading = true;
    });

    print("Pressed");
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    try {
      List<Uint8List>? selectedImages =
          await ImagePickerWeb.getMultiImagesAsBytes();

      if (selectedImages == null || selectedImages.isEmpty) {
        print("No images selected.");
      } else {
        resultList = selectedImages;
      }
    } catch (e) {
      print("Error selecting images: $e");
    }

    for (var item in resultList) {
      final url = await upLoadImage(item);
      urls.add(url);
    }

    // while (urls.length < 10) {
    //   String blank =
    //       'https://learn.canva.com/wp-content/uploads/2014/10/whitespace.jpg';
    //   urls.add(blank);
    // }

    if (!mounted) return;

    setState(() {
      imagez = urls;
      isLoading = false;
    });
  }

  void clear7() {
    setState(() {
      imagez = [];
    });

    print("cleared 7");
  }

  Widget buildImage(String imageData) {
    if (imageData.startsWith('http')) {
      // It's a URL
      return CachedNetworkImage(
        imageUrl: imageData,
        placeholder: (context, url) => const Center(
          child: SizedBox(
            height: 40.0,
            width: 40.0,
            child: CircularProgressIndicator(value: 1.0),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      );
    } else {
      try {
        final decodedBytes = base64Decode(imageData);
        return Image.memory(
          decodedBytes,
          fit: BoxFit.cover,
        );
      } catch (e) {
        print('Error decoding base64 image: $e');
        return Icon(Icons.error);
      }
    }
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
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        child: const Text(
                          "okay",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
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
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
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
        Expanded(
          // height: h * 0.54,
          child: isLoading == true
              ? const Center(
                  child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator()))
              : GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 6,
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
                        child: Image.memory(
                          base64Decode(imagez[index]),
                          fit: BoxFit.cover,
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
