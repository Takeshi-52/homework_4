import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class led_matrix extends StatefulWidget {
  const led_matrix({super.key});

  @override
  _led_matrixState createState() => _led_matrixState();
}

class _led_matrixState extends State<led_matrix> {
  int counter = 0;

  void increNum() {
    setState(() {
      counter = (counter + 1) % 100;
    });
  }

  void decreNum() {
    setState(() {
      counter = (counter - 1) % 100;
      if (counter < 0) counter += 100;
    });
  }

  String _formatCounter(int value) {
    return value.toString().padLeft(2, '0');
  }

  static const dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF99BC85),
      title: Center(
        child: Text(
          'CP-SU LED MATRIX',
          style: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color(0xFFE1F0DA),
          ),
        ),
      ),
    );
  }

  Widget ButtonUp() {
    return ButtonTheme(
      minWidth: 90.0,
      height: 90.0,
      child: ElevatedButton(
        onPressed: increNum,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          primary: Color(0xFFFFFFFF),
        ),
        child: Icon(
          Icons.arrow_drop_up,
          size: 70.0,
          color: Color(0xFF99BC85),
        ),
      ),
    );
  }

  Widget ButtonDown() {
    return ButtonTheme(
      minWidth: 90.0,
      height: 90.0,
      child: ElevatedButton(
        onPressed: decreNum,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          primary: Color(0xFFFFFFFF),
        ),
        child: Icon(
          Icons.arrow_drop_down,
          size: 70.0,
          color: Color(0xFF99BC85),
        ),
      ),
    );
  }

  Widget _buildDot(int value) {
    Color dotColor;
    if (value == 1) {
      dotColor = Color(0xFF99BC85);
    } else if (value == 0) {
      dotColor = Color(0xFFcbcbcb);
    } else {
      dotColor = Colors.transparent;
    }
    return Container(
      width: 19.0,
      height: 19.0,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildRow(List<int> dotList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var value in dotList)
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: _buildDot(value),
          ),
      ],
    );
  }

  Widget _buildDigit(List<List<int>> rowList) {
    return Column(
      children: [
        for (var row in rowList) _buildRow(row),
      ],
    );
  }

  // Widget _buildCounterText() {
  //   return Text(
  //     _formatCounter(counter),
  //     style: GoogleFonts.roboto(
  //       fontSize: 32.0,
  //     ),
  //   );
  // }

  Widget _LEDDisplay(String value) {
    int firstDigit = int.parse(value[0]);
    int secondDigit = int.parse(value[1]);

    return Container(
      width: 380.0,
      height: 280.0,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFFFFFF), width: 12.0),
          color: Color(0xFFEFECEC),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD4E7C5),
              offset: Offset.zero,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDigit(dotsData[firstDigit]),
              SizedBox(width: 20.0),
              _buildDigit(dotsData[secondDigit]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonUp(),
            _LEDDisplay(_formatCounter(counter)),
            //_buildCounterText(),
            ButtonDown(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageBody(),
    );
  }
}
