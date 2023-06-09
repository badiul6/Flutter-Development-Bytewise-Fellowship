// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/container_provider.dart';
import 'package:state_management/screens/count_example.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild all");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Slide to Shift Container",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 70,
          ),
          Consumer<ContainerProvider>(
            builder: (context, value, child) {
              return Slider(
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                    value.setValue2(val);
                  });
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Consumer<ContainerProvider>(
                  builder: (context, value, child) {
                    return Container(
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value2),
                      ),
                      // child: const Text("Container1"),
                    );
                  },
                ),
              ),
              Expanded(
                child: Consumer<ContainerProvider>(
                  builder: (context, value, child) {
                    return Container(
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      // child: const Text("Container1"),
                    );
                  },
                ),
              )
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CountExample()));
      },
        child: const Icon(Icons.arrow_forward),
      ),

    );
  }
}
