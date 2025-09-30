import 'package:flutter/material.dart';

/// ================================
/// Section 3: Lifting State Up
/// ================================

// Task 1: Switch Manager
class SwitchManagerPage extends StatefulWidget {
  const SwitchManagerPage({super.key});

  @override
  State<SwitchManagerPage> createState() => _SwitchManagerPageState();
}

class _SwitchManagerPageState extends State<SwitchManagerPage> {
  bool _isOn = false;

  void _toggleSwitch(bool value) {
    setState(() => _isOn = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Manager')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            value: _isOn,
            onChanged: _toggleSwitch,
            title: const Text('Enable feature'),
          ),
          Text(_isOn ? 'Switch is ON' : 'Switch is OFF'),
        ],
      ),
    );
  }
}

// Task 2: Greeting (Parent & Child communication)
class NameInput extends StatelessWidget {
  final ValueChanged<String> onNameChanged;
  const NameInput({super.key, required this.onNameChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Enter your name'),
      onChanged: onNameChanged,
    );
  }
}

class NameParentPage extends StatefulWidget {
  const NameParentPage({super.key});

  @override
  State<NameParentPage> createState() => _NameParentPageState();
}

class _NameParentPageState extends State<NameParentPage> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greeting Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NameInput(onNameChanged: (val) {
              setState(() => _name = val);
            }),
            const SizedBox(height: 20),
            Text('Hello, $_name'),
          ],
        ),
      ),
    );
  }
}

// Task 3: Temperature Converter
class TemperatureInput extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<String> onChanged;

  const TemperatureInput({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      controller: TextEditingController(text: value.toStringAsFixed(1)),
    );
  }
}

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  double _celsius = 0.0;
  double _fahrenheit = 32.0;

  void _updateCelsius(String val) {
    final parsed = double.tryParse(val);
    if (parsed != null) {
      setState(() {
        _celsius = parsed;
        _fahrenheit = (_celsius * 9 / 5) + 32;
      });
    }
  }

  void _updateFahrenheit(String val) {
    final parsed = double.tryParse(val);
    if (parsed != null) {
      setState(() {
        _fahrenheit = parsed;
        _celsius = (_fahrenheit - 32) * 5 / 9;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TemperatureInput(
              label: 'Celsius',
              value: _celsius,
              onChanged: _updateCelsius,
            ),
            TemperatureInput(
              label: 'Fahrenheit',
              value: _fahrenheit,
              onChanged: _updateFahrenheit,
            ),
          ],
        ),
      ),
    );
  }
}

// Task 4: Survey App
class SurveyAppPage extends StatefulWidget {
  const SurveyAppPage({super.key});

  @override
  State<SurveyAppPage> createState() => _SurveyAppPageState();
}

class _SurveyAppPageState extends State<SurveyAppPage> {
  String _favoriteColor = 'Red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Survey App')),
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Red'),
            value: 'Red',
            groupValue: _favoriteColor,
            onChanged: (value) =>
                setState(() => _favoriteColor = value.toString()),
          ),
          RadioListTile(
            title: const Text('Green'),
            value: 'Green',
            groupValue: _favoriteColor,
            onChanged: (value) =>
                setState(() => _favoriteColor = value.toString()),
          ),
          RadioListTile(
            title: const Text('Blue'),
            value: 'Blue',
            groupValue: _favoriteColor,
            onChanged: (value) =>
                setState(() => _favoriteColor = value.toString()),
          ),
          const SizedBox(height: 20),
          Text('Your favorite color: $_favoriteColor'),
        ],
      ),
    );
  }
}

// Task 5: Prop Drilling vs Provider
class PropDrillBeforeAfterPage extends StatelessWidget {
  const PropDrillBeforeAfterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prop Drilling vs Provider')),
      body: const Center(
        child: Text(
          'In Flutter, passing props down multiple widgets is Prop Drilling.\n'
          'Using Provider avoids drilling by giving direct access to state.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
