import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tinycolor/tinycolor.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map hell = {
    "0": ["0", 1],
    "1": ["1", 1],
    "2": ["2", 1],
    "3": ["3", 1],
    "4": ["4", 1],
    "5": ["5", 1],
    "6": ["6", 1],
    "7": ["7", 1],
    "8": ["8", 1],
    "9": ["9", 1],
    "10": ["10", 1],
    "11": ["11", 1],
    "12": ["12", 1],
    "13": ["13", 2],
    "14": ["14", 1.5],
    "15": ["15", 1],
    "16": ["16", 1],
    "17": ["17", 1],
    "18": ["18", 1],
    "19": ["19", 1],
    "20": ["20", 1],
    "21": ["21", 1],
    "22": ["22", 1],
    "23": ["23", 1],
    "24": ["24", 1],
    "25": ["25", 1],
    "26": ["26", 1],
    "27": ["27", 1.5],
    "28": ["28", 1.75],
    "29": ["29", 1],
    "30": ["30", 1],
    "31": ["31", 1],
    "32": ["32", 1],
    "33": ["33", 1],
    "34": ["34", 1],
    "35": ["35", 1],
    "36": ["36", 1],
    "37": ["37", 1],
    "38": ["38", 1],
    "39": ["39", 1],
    "40": ["40", 2.25],
    "41": ["41", 2.25],
    "42": ["42", 1],
    "43": ["43", 1],
    "44": ["44", 1],
    "45": ["45", 1],
    "46": ["46", 1],
    "47": ["47", 1],
    "48": ["48", 1],
    "49": ["49", 1],
    "50": ["50", 1],
    "51": ["51", 1],
    "52": ["52", 2.75],
    "53": ["53", 1.25],
    "54": ["54", 1.25],
    "55": ["55", 1.25],
    "56": ["56", 6.25],
    "57": ["57", 1.25],
    "58": ["58", 1.25],
    "59": ["59", 1.25],
    "60": ["60", 1.25]
  };
  List<Widget> keyArray = [];
  @override
  void initState() {
    super.initState();
    // for (int i = 0; i < 13; i++) {
    //   hello.add(newMethod(70));
    // }

    for (var item in hell.keys) {
      hell[item.toString()].add(Colors.white);
      keyArray.add(
          newMethod(hell[item.toString()][1], item, hell[item.toString()][2]));
    }
    setState(() {});
  }

  void changeColor(Color color, key) {
    setState(() {
      keyArray[int.parse(key)] = newMethod(hell[key.toString()][1], key, color);
      currentColor = color;
    });
  }

  Color pickerColor = Color(0xFFE70C0C);
  Color currentColor = Color(0xFF73FF00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Container(
                      width: 1050,
                      height: 350,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: keyArray,
                      )),
                ),
                TextButton(
                    onPressed: () {
                      print("Hello");
                    },
                    child: Text("Convert"))
              ],
            ),
          ),
        ));
  }

  Widget newMethod(width, key, Color color) {
    return GestureDetector(
      onTap: () {
        //hello world
        print(key);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: const EdgeInsets.all(0.0),
              contentPadding: const EdgeInsets.all(0.0),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 6,
                          child: SelectableText(
                              "Current color: #${color == Colors.white ? " " : currentColor.toString().substring(10, currentColor.toString().length - 1)}"),
                        ),
                        Flexible(
                            flex: 1,
                            child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => Navigator.of(context).pop()))
                      ],
                    ),
                    ColorPicker(
                      pickerColor: currentColor,
                      onColorChanged: (color) {
                        changeColor(color, key);
                      },
                      colorPickerWidth: 300.0,
                      pickerAreaHeightPercent: 0.7,
                      enableAlpha: false,
                      displayThumbColor: true,
                      showLabel: true,
                      paletteType: PaletteType.hsv,
                      pickerAreaBorderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(2.0),
                        topRight: const Radius.circular(2.0),
                      ),
                    ),
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter a a hexcode here'),
                      onSubmitted: (value) {
                        changeColor(TinyColor.fromString(value).color, key);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        // margin: EdgeInsets.all(1.05),
        width: 70 * width,
        height: 70,
        alignment: Alignment(0, -0.5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: color.toTinyColor().darken(10).color),
        child: Container(
          width: (70 * width) - 20,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: color),
          child: Center(child: Text("")),
        ),
      ),
    );
  }
}
