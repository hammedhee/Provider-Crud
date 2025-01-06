import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:providercrud/controllers/noteprovider.dart';
import 'package:providercrud/model/crudmodel.dart';

class Addscreen extends StatelessWidget {
  Addscreen({super.key});

  final titelCondroller = TextEditingController();
  final discriptionCondroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Provider.of<Noteprovider>(context).getnotes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Your Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: titelCondroller,
                decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Titel is required';
                  }
                  return null;
                },
              ),
              Gap(20),
              TextFormField(
                controller: discriptionCondroller,
                decoration: InputDecoration(
                  labelText: 'Discription',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'Discription is required';
                  }
                  return null;
                },
              ),
              Gap(30),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState?.validate() == true) {
                    savebtn(context);
                  }
                },
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 247, 234, 187),
                  ),
                  child: Center(
                      child: Text(
                    'SAVE',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future savebtn(BuildContext context) async {
    final titlee = titelCondroller.text;
    final discription = discriptionCondroller.text;

    final notessss = Notess(title: titlee, discription: discription);
    Provider.of<Noteprovider>(context, listen: false).addNotes(notessss);
    titelCondroller.clear();
    discriptionCondroller.clear();
    Navigator.pop(context);
    print(notessss.title!);
  }
}
