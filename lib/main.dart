import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var choosenStyles = <String>[];
  late TextEditingController inputController;
  String formattedText = "";

  @override
  void initState() {
    inputController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hng Internship",
      home: Scaffold(

        appBar: AppBar(
          title: Text("HNG Internship"),
        ),
        body: Container(
          decoration: BoxDecoration(
//            image: DecorationImage(
////              image: AssetImage("assets/hng.png")
//            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Select the text formatting style of your input"),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  GestureDetector(
                    onTap: () => addStyles("bold"),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: isSelected("bold") ? Colors.black87 : Colors.transparent,),
                      ),
                      child: Text("Bold"),
                    ),
                  ),
                    GestureDetector(
                      onTap: () => addStyles("underline"),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: isSelected("underline") ? Colors.black87 : Colors.transparent,),
                        ),
                        child: Text("Underline"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => addStyles("italic"),
                      child: Container(

                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: isSelected("italic") ? Colors.black87 : Colors.transparent,),

                        ),
                        child: Text("Italic"),
                      ),
                    ),
                ],),
                SizedBox(height: 20,),
                TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)
                    ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)
                      ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: displayText, child: Text("Display")),
                SizedBox(height: 10),
                Text(formattedText, style: TextStyle(
                  fontSize: 25,
                  fontStyle: isSelected("italic") ? FontStyle.italic : FontStyle.normal,
                  fontWeight: isSelected("bold") ? FontWeight.bold : FontWeight.normal,
                  decoration: isSelected("underline") ? TextDecoration.underline : TextDecoration.none
                ),

                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  void displayText() {
    setState(() {
formattedText = inputController.text;
    });

  }
  void addStyles(String name) {
    setState(() {
      if (!isSelected(name)) {
      choosenStyles.add(name);}
      else {
        choosenStyles.removeWhere((element) => element == name);
      }
    });
  }

  bool isSelected(String formatStyle) {
    return choosenStyles.contains(formatStyle);
  }
}
