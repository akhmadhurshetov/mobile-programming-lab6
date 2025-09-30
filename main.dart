import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import models
import 'models/counter_model.dart';
import 'models/user_model.dart';
import 'models/theme_model.dart';
import 'models/todo_list_model.dart';
import 'models/favorite_model.dart';
import 'models/cart_model.dart';
import 'models/async_model.dart';
import 'models/settings_model.dart';

// Import sections
import 'sections/section1_stateless_stateful.dart';
import 'sections/section2_setstate.dart';
import 'sections/section3_lifting_state.dart';
import 'sections/section4_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => TodoListModel()),
        ChangeNotifierProvider(create: (_) => FavoriteModel()),
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => AsyncModel()),
        ChangeNotifierProvider(create: (_) => SettingsModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const LabMenu(),
          );
        },
      ),
    );
  }
}

/// Menu of all tasks
class LabMenu extends StatelessWidget {
  const LabMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = {
      // Section 1
      'Static vs Interactive Profile': const StaticInteractivePage(),
      'Product Card': const ProductCardPage(),
      'Like Button (non-interactive)': const LikeButton(),
      'Interactive Like Button': const InteractiveLikeButtonPage(),
      'TextFormField State': const UserNameInputPage(),
      // Section 2
      'Counter + Decrement': const CounterWithDecrement(),
      'Toggle Visibility': const ToggleVisibilityPage(),
      'Add Items to List': const ItemListPage(),
      'Color Box': const ColorBoxPage(),
      // Section 3
      'Switch Manager': const SwitchManagerPage(),
      'Greeting': const NameParentPage(),
      'Temperature Converter': const TemperatureConverterPage(),
      'Survey App': const SurveyAppPage(),
      'Prop Drilling vs Provider': const PropDrillBeforeAfterPage(),
      // Section 4
      'Provider Counter': const ProviderCounterPage(),
      'Provider User Change': const ProviderUserPage(),
      'Theme Switcher': const ThemeSwitcherPage(),
      'Todo List (Provider)': const TodoListPageScreen(),
      'Favorite (Provider)': const FavoriteProviderPage(),
     
