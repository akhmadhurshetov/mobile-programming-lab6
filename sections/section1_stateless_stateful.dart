import 'package:flutter/material.dart';

/// ================================
/// Section 1: Stateless vs Stateful
/// ================================

// Task 1: Static vs Interactive Profile
class StaticProfileCard extends StatelessWidget {
  const StaticProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('John Doe'),
        subtitle: Text('john.doe@email.com'),
      ),
    );
  }
}

class InteractiveProfileCard extends StatefulWidget {
  const InteractiveProfileCard({super.key});

  @override
  State<InteractiveProfileCard> createState() =>
      _InteractiveProfileCardState();
}

class _InteractiveProfileCardState extends State<InteractiveProfileCard> {
  bool _showEmail = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Jane Smith'),
        subtitle: _showEmail ? const Text('jane.smith@email.com') : null,
        trailing: IconButton(
          icon: Icon(_showEmail ? Icons.visibility : Icons.visibility_off),
          onPressed: () => setState(() => _showEmail = !_showEmail),
        ),
      ),
    );
  }
}

class StaticInteractivePage extends StatelessWidget {
  const StaticInteractivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Static vs Interactive')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            StaticProfileCard(),
            SizedBox(height: 12),
            InteractiveProfileCard(),
          ],
        ),
      ),
    );
  }
}

// Task 2: ProductCard (Stateless)
class ProductCardWidget extends StatelessWidget {
  final String productName;
  final double price;

  const ProductCardWidget({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(productName),
        subtitle: Text('\$${price.toStringAsFixed(2)}'),
      ),
    );
  }
}

class ProductCardPage extends StatelessWidget {
  const ProductCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Card')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          ProductCardWidget(productName: 'Laptop', price: 899.99),
          ProductCardWidget(productName: 'Headphones', price: 59.99),
          ProductCardWidget(productName: 'Coffee Mug', price: 9.50),
        ],
      ),
    );
  }
}

// Task 3: LikeButton (non-interactive)
class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false; // stays false for now

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LikeButton (non-interactive)')),
      body: Center(
        child: Icon(
          _isLiked ? Icons.favorite : Icons.favorite_border,
          size: 70,
          color: Colors.red,
        ),
      ),
    );
  }
}

// Task 4: Interactive LikeButton
class InteractiveLikeButtonPage extends StatefulWidget {
  const InteractiveLikeButtonPage({super.key});

  @override
  State<InteractiveLikeButtonPage> createState() =>
      _InteractiveLikeButtonPageState();
}

class _InteractiveLikeButtonPageState
    extends State<InteractiveLikeButtonPage> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive LikeButton')),
      body: Center(
        child: IconButton(
          iconSize: 80,
          icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          onPressed: () => setState(() => _isLiked = !_isLiked),
        ),
      ),
    );
  }
}

// Task 5: TextFormField with state
class UserNameInputPage extends StatefulWidget {
  const UserNameInputPage({super.key});

  @override
  State<UserNameInputPage> createState() => _UserNameInputPageState();
}

class _UserNameInputPageState extends State<UserNameInputPage> {
  String _userName = '';
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextFormField State')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter your name'),
              onChanged: (val) => setState(() => _userName = val),
            ),
            const SizedBox(height: 20),
            Text('Hello, $_userName'),
          ],
        ),
      ),
    );
  }
}
