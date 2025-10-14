import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 static const platform = MethodChannel('com.example.battery');

 String _batteryLevel = "unknown";

 Future<void> _getBatteryLevel() async{
   String batteryLevel;
   try{
     batteryLevel = await platform.invokeMethod("getBatteryLevel");
   }on PlatformException catch(e){
     batteryLevel = "Error getting battery level${e.message}";
   }
   setState(() {
     _batteryLevel = batteryLevel;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Channel Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Button pressed', style: TextStyle(fontSize: 20)),
            Text(_batteryLevel),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _getBatteryLevel,
              icon: const Icon(Icons.battery_0_bar),
              label: const Text('Battery Level'),
            ),
          ],
        ),
      ),
    );
  }
}
