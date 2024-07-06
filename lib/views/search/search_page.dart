import 'package:animal/controller/apiController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onSubmitted: (val) {
              Provider.of<ApiController>(context, listen: false)
                  .initData(name: val);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<ApiController>(context).allAnimals.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  Provider.of<ApiController>(context).allAnimals[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
