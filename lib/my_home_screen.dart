import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  late TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACbf169440c2dc5b890f3a44ea79d6db93',
        authToken: '7c423ce9ee3b35cf8d25164137addb36',
        twilioNumber: '+19288772819');
    super.initState();
  }
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+8801746118188', messageBody: 'Help Me Ankon');
  }
  void sendSms2() async {
    twilioFlutter.sendSMS(
        toNumber: '+8801535494780', messageBody: 'Help Me Shafin');
  }
  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);
    await twilioFlutter.getSMS('***************************');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: sendSms,
              child: const Text('Ankon'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 50),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: sendSms2,
              child: const Text('Shafin'),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}