import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e.code);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Savings',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pay through UPI ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter UPI Number',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 300,
                  child: Center(
                    child: Stack(
                      children: [
                        AspectRatio(
                            aspectRatio: 11.0 / 10.0,
                            child: CameraPreview(controller)),
                        Positioned.fill(
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black38, width: 5.0),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(child: HomePage())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: .5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search Contact',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Select Number',
                      suffixIcon: Icon(Icons.contacts),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://content.fakeface.rest/male_23_84fb4a3a54582772ac5fc327c5dd26cb555889f2.jpg"),
                      ),
                      title: Text(
                        "Nimit Patel",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("75300009088"),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
