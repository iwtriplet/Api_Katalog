import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecatalog/themes/app_theme.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const CameraApp());
// }

/// CameraApp is the Main Application.
class CameraPage extends StatefulWidget {
  final Function(XFile) takePicture;
  final List<CameraDescription>? cameras;

  /// Default Constructor
  const CameraPage({
    Key? key,
    required this.takePicture,
    this.cameras,
  }) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraPage> {
  late CameraController controller;

  XFile? capturedImage;

  Future takePicture() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      controller.setFlashMode(FlashMode.torch);
      XFile image = await controller.takePicture();
      controller.setFlashMode(FlashMode.off);

      widget.takePicture(image);

      Navigator.pop(context);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    } catch (e) {
      // Tangani kesalahan yang mungkin terjadi saat mengambil foto
    }
  }

  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CameraPreview(controller),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.appColors.primary,
                    ),
                    onPressed: () {
                      takePicture();
                    },
                    child: const Text('Ambil Poto'),
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
              color: Colors.grey,
              child: Center(
                child: Text('Untuk Iklan'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
