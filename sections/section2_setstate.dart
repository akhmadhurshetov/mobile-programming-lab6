import 'package:flutter/material.dart';

/// ================================
/// Section 2: setState examples
/// ================================

// Task 1: Counter with Increment & Decrement
class CounterWithDecrement extends StatefulWidget {
  const CounterWithDecrement({super.key});

  @override
  State<CounterWithDecrement> createState() => _CounterWithDecrementState();
}

class _CounterWithDecrementState extends State<CounterWithDecrement> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter + Decrement')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Count: $_counter', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrement, child: const Text('-')),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: _increment, child: const Text('+')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Task 2: Toggle Visibility
class ToggleVisibilityPage extends StatefulWidget {
  const ToggleVisibilityPage({super.key});

  @override
  State<ToggleVisibilityPage> createState() => _ToggleVisibilityPageState();
}

class _ToggleVisibilityPageState extends State<ToggleVisibilityPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Visibility')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isVisible)
              const Text('Now you see me!', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => _isVisible = !_isVisible),
              child: Text(_isVisible ? 'Hide' : 'Show'),
            )
          ],
        ),
      ),
    );
  }
}

// Task 3: Add Items to a List
class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final List<String> _items = [];
  final _controller = TextEditingController();

  void _addItem() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _items.add(text);
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Items to List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter item',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, i) => ListTile(
                  title: Text(_items[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Task 4: Color Box
class ColorBoxPage extends StatefulWidget {
  const ColorBoxPage({super.key});

  @override
  State<ColorBoxPage> createState() => _ColorBoxPageState();
}

class _ColorBoxPageState extends State<ColorBoxPage> {
  Color _color = Colors.blue;

  void _changeColor() {
    setState(() {
      _color = _color == Colors.blue ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Box')),
      body: Center(
        child: GestureDetector(
          onTap: _changeColor,
          child: Container(
            width: 120,
            height: 120,
            color: _color,
            child: const Center(
              child: Text(
                'Tap me',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
