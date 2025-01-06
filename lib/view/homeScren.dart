import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:providercrud/controllers/noteprovider.dart';
import 'package:providercrud/model/crudmodel.dart';
import 'package:providercrud/view/addscreen.dart';

class Homescren extends StatelessWidget {
  const Homescren({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Noteprovider>(context, listen: false).getnotes();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addscreen(),
              ));
        },
        child: Text(
          'TEXT',
          style: TextStyle(fontSize: 18),
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Consumer<Noteprovider>(
        builder: (context, noteprovider, child) {
          return ListView.builder(
            itemCount: noteprovider.notestlist.length,
            itemBuilder: (context, index) {
              final datas = noteprovider.notestlist[index];
              return Container(
                height: 50,
                width: 300,
                child: Card(
                  color: const Color.fromARGB(255, 243, 227, 172),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(datas.title.toString()),
                          IconButton(
                              onPressed: () {
                                noteprovider.deletenotes(index);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
