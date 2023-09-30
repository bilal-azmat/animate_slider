import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_slider/widget_slider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = SliderController(
    duration: const Duration(milliseconds: 600),
  );

  final images = const [
"https://media.istockphoto.com/id/1419410282/photo/silent-forest-in-spring-with-beautiful-bright-sun-rays.jpg?s=1024x1024&w=is&k=20&c=K8yBJVB-TtpPF1O2zOhVlzXECDxJsadlRrLf4gXXNkk=",
"https://media.istockphoto.com/id/1442960535/photo/sustainble-green-building-eco-friendly-building-in-modern-city-sustainable-glass-office.jpg?s=1024x1024&w=is&k=20&c=NQO5E51YZaqPtD4ioB9y9EIMujKG4GHTnW86T5O4vLc=",
"https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055_1280.jpg",
"https://media.istockphoto.com/id/1419410282/photo/silent-forest-in-spring-with-beautiful-bright-sun-rays.jpg?s=1024x1024&w=is&k=20&c=K8yBJVB-TtpPF1O2zOhVlzXECDxJsadlRrLf4gXXNkk=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.3),
      body: Center(
        child: WidgetSlider(
          fixedSize: 300,
          aspectRatio: 4.0,
          controller: controller,
          itemCount: images.length,
          itemBuilder: (context, index, activeIndex) {
            return CupertinoButton(
              onPressed: () async => await controller.moveTo?.call(index),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(images[index]),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade50,
                      offset: const Offset(0, 8),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(0, 8),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}