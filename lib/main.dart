import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


// Entry Function
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imatch',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),

      // Designate the home page
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> imgVecData = [];

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/img_vec_1504.json').then((String jsonString) {
      setState(() {
        imgVecData = json.decode(jsonString);
      });
    }).catchError((error) {
      print('Error loading JSON data: $error');
    });
  }

  File? _image;

  Future<void> _getImageFromGallery() async {
    // Select image from Gallery.
    // /sdcard/Pictures/JPEGImages
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _imgSearch() async {
    // String firstImage = imgVecData['images'][0]['url'];
    String firstImage = imgVecData[0]['img_name'];
    print('First image name: $firstImage');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Matching"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline))
        ],
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Astraeus"), accountEmail: Text("123456@ntu.com"))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: _image != null
                    ? DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                )
                    : DecorationImage(
                  image: AssetImage("images/upload.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                _getImageFromGallery();
              },
              child: Text("Upload Image"),
            ),
            SizedBox(height: 20), //
            ElevatedButton(
              onPressed: () {
                _imgSearch();
              },
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Change the background color
                // minimumSize: MaterialStateProperty.all<Size>(Size(200, 50))
              ),
              child: Text("Match Image"),
            ),
            SizedBox(height: 20), //
          ],
        ),
      ),
    );
  }
}