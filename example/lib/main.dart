import 'package:flutter/material.dart';
import 'package:light_plugin/light_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LightControlScreen(),
    );
  }
}

class LightControlScreen extends StatefulWidget {
  @override
  _LightControlScreenState createState() => _LightControlScreenState();
}

class _LightControlScreenState extends State<LightControlScreen> {
  bool isLightOn = false;

  void _toggleLight() async {
    try {
      await LightPlugin.toggleLight(!isLightOn);
      setState(() {
        isLightOn = !isLightOn;
      });
    } catch (e) {
      // Handle error (e.g., show dialog)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Control'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggleLight,
          child: Text(isLightOn ? 'Turn Light Off' : 'Turn Light On'),
        ),
      ),
    );
  }
}
