import 'package:flutter/material.dart';
import 'model/posts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        final post = Posts();
        post.getdata();
        return post;
      },
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    bool isFirstData = Provider.of<Posts>(context).currentData == 1;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Getting data With provider"),
        ),
        body: Provider.of<Posts>(context, listen: true).loading
            ? const Center(
                child: SpinKitWanderingCubes(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  size: 70.0,
                ),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '${Provider.of<Posts>(context).title}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24.0),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            '${Provider.of<Posts>(context).body}',
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (!isFirstData)
                                ElevatedButton(
                                  child: const Text('previous data'),
                                  onPressed: () {
                                    Provider.of<Posts>(context, listen: false)
                                        .prevdata();
                                  },
                                ),
                              ElevatedButton(
                                child: const Text('next data'),
                                onPressed: () {
                                  Provider.of<Posts>(context, listen: false)
                                      .nextdata();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
