import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          color: Colors.blue,
          child: const Center(
              child: Text('Header', style: TextStyle(color: Colors.white))),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                width: 200,
                color: Colors.grey[300],
                child: const Center(child: Text('Navigation')),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: const Center(child: Text('Content')),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 80,
          color: Colors.blue,
          child: const Center(
              child: Text('Footer', style: TextStyle(color: Colors.white))),
        ),
      ],
    );
  }
}
