import 'package:material_ui/material_ui.dart';

import 'package:mupdf_android/mupdf_android.dart';
import 'package:mupdf_android/mupdf_document.dart';
import 'package:than_pkg/than_pkg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String resultText = 'Unknown';
  final pkg = MupdfAndroid();

  @override
  void initState() {
    super.initState();
  }

  MuPdfDocument? _doc;

  void onTest() async {
    final per = ThanPkg.android.permission;
    if (!await per.isStoragePermissionGranted()) {
      await per.requestStoragePermission();
      return;
    }
    _doc = await MupdfAndroid.instance.open('');
    final doc = _doc;
    if (doc != null) {
      resultText = 'pageCount: ${(await doc.pageCount)}';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text(resultText)),
        floatingActionButton: FloatingActionButton(onPressed: onTest),
      ),
    );
  }
}
