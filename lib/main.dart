import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shader compilation error reproduction'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _errorsShouldBeThere = false;

  void _openImagePicker() async {
    await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _errorsShouldBeThere = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _openImagePicker(),
              child: Text("Click to open image picker"),
            ),
            Visibility(
              visible: _errorsShouldBeThere,
              child: Text(
                  "Errors ('Shader compilation error') should be visible in the Debug Console now."),
            )
          ],
        ),
      ),
    );
  }
}
