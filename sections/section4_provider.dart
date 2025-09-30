import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import models
import '../models/counter_model.dart';
import '../models/user_model.dart';
import '../models/theme_model.dart';
import '../models/todo_list_model.dart';
import '../models/favorite_model.dart';
import '../models/cart_model.dart';
import '../models/async_model.dart';
import '../models/settings_model.dart';

/// ================================
/// Section 4: Provider examples
/// ================================

// Task 1: Provider Counter
class ProviderCounterPage extends StatelessWidget {
  const ProviderCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${counter.count}', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: counter.increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: counter.decrement,
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}

// Task 2: Provider User Change
class ProviderUserPage extends StatelessWidget {
  const ProviderUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Provider User')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current user: ${user.username}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: user.changeToAdmin,
              child: const Text('Change to Admin'),
            ),
          ],
        ),
      ),
    );
  }
}

// Task 3: Theme Switcher
class ThemeSwitcherPage extends StatelessWidget {
  const ThemeSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Switcher')),
      body: Center(
        child: SwitchListTile(
          title: const Text('Dark Mode'),
          value: theme.isDarkMode,
          onChanged: (_) => theme.toggle(),
        ),
      ),
    );
  }
}

// Task 4: Todo List with Provider
class TodoListPageScreen extends StatelessWidget {
  const TodoListPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = context.watch<TodoListModel>();
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List (Provider)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    todoList.addTask(controller.text);
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.tasks.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(todoList.tasks[i]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => todoList.removeTask(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Task 5: Favorite Toggle
class FavoriteProviderPage extends StatelessWidget {
  const FavoriteProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite (Provider)')),
      body: Center(
        child: IconButton(
          iconSize: 80,
          icon: Icon(fav.isFav ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          onPressed: fav.toggle,
        ),
      ),
    );
  }
}

// Task 6: Shopping Cart
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Shoes'),
                  trailing: ElevatedButton(
                    onPressed: () => cart.add('Shoes'),
                    child: const Text('Add'),
                  ),
                ),
                ListTile(
                  title: const Text('T-Shirt'),
                  trailing: ElevatedButton(
                    onPressed: () => cart.add('T-Shirt'),
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Text('Cart items:'),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(cart.items[i]),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () => cart.removeAt(i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Task 7: Async Loading
class AsyncScreen extends StatelessWidget {
  const AsyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final asyncModel = context.watch<AsyncModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Async Example')),
      body: Center(
        child: asyncModel.isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(asyncModel.data.isEmpty
                      ? 'No data yet'
                      : asyncModel.data),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: asyncModel.fetchData,
                    child: const Text('Fetch Data'),
                  ),
                ],
              ),
      ),
    );
  }
}

// Task 8: Settings with Provider
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: settings.notificationsEnabled,
              onChanged: settings.toggleNotifications,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Volume'),
                Expanded(
                  child: Slider(
                    value: settings.volumeLevel,
                    onChanged: settings.setVolume,
                  ),
                ),
              ],
            ),
            Text('Volume Level: ${(settings.volumeLevel * 100).round()}%'),
          ],
        ),
      ),
    );
  }
}
