import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Entry Function
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class HomePage extends StatelessWidget {
  @ override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Matching"),
        centerTitle: true,
        actions: <Widget> [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline))
        ],
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget> [
            UserAccountsDrawerHeader(accountName: Text("Astraeus"), accountEmail: Text("123456@ntu.com"))
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
                image: DecorationImage(
                  image: AssetImage("images/upload.jpg"),
                  // image: AssetImage(isButtonPressed ? 'image2.png' : 'image1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 100),

            ElevatedButton(
              onPressed: () {
                print("Upload Image");
              },
              child: Text("Upload Image"),
            ),

            SizedBox(height: 20), //

            // TextButton(
            //   onPressed: () {
            //     print('TextButton Clicked!');
            //   },
            //   child: Text('TextButton'),
            // ),
          ],
        ),
      )
    );
  }
}
