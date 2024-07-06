import 'package:animal/controller/apiController.dart';
import 'package:animal/routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = Provider.of<ApiController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.search);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.purple,
              Colors.orange,
            ],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          ),
        ),
        child: ListView.builder(
          itemCount: apiController.allAnimals.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              apiController.allAnimals[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
