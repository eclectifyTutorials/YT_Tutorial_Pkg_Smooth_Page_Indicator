// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true,);
  final _itemCount = 5;
  final colors = const [
    Colors.red,
    Colors.green,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.blue,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smooth Page Indicator"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller,
              itemCount: _itemCount,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    // width: double.infinity,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(index.toString(), style: TextStyle(color: Colors.white, fontSize: 40,),),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            child: Text(
              'Worm',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: _itemCount,
            effect: WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              // strokeWidth: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Jumping Dot',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            child: SmoothPageIndicator(
              controller: controller,
              count: _itemCount,
              effect: JumpingDotEffect(
                dotHeight: 16,
                dotWidth: 16,
                jumpScale: .7,
                verticalOffset: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Swap',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            child: SmoothPageIndicator(
              controller: controller,
              count: _itemCount,
              effect: SwapEffect(
                dotHeight: 16,
                dotWidth: 16,
                type: SwapType.yRotation,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Text(
              'Scrolling Dots',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          SmoothPageIndicator(
              controller: controller,
              count: _itemCount,
              effect: ScrollingDotsEffect(
                activeStrokeWidth: 2.6,
                activeDotScale: 1.3,
                maxVisibleDots: 5,
                radius: 8,
                spacing: 10,
                dotHeight: 12,
                dotWidth: 12,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              'Customizable Effect',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            // color: Colors.red.withOpacity(.4),
            child: SmoothPageIndicator(
              controller: controller,
              count: _itemCount,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 32,
                  height: 12,
                  color: Colors.indigo,
                  rotationAngle: 180,
                  verticalOffset: -10,
                  borderRadius: BorderRadius.circular(24),
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.indigo,
                  // ),
                ),
                dotDecoration: DotDecoration(
                  width: 24,
                  height: 12,
                  color: Colors.grey,
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.grey,
                  // ),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(2),
                  //     topRight: Radius.circular(16),
                  //     bottomLeft: Radius.circular(16),
                  //     bottomRight: Radius.circular(2)),
                  borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
                // activeColorOverride: (i) => colors[i],
                inActiveColorOverride: (i) => colors[i],
              ),
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}

