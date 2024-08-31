import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rating = 0;
  bool _isEditing = false;
  bool _isEditing2 = false;
  String _name = "Nazirov O";
  String _name2 = "R 1";
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = _name;
  }

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  void _editName() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }
  void _editName2() {
    setState(() {
      _isEditing2 = !_isEditing2;
    });
  }

  void _saveName2() {
    setState(() {
      _name2 = _controller2.text;
      _isEditing2 = false;
    });
  }
  void _saveName() {
    setState(() {
      _name = _controller.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Svetofor Ilovasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container with Image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.orange,
                width: double.infinity,
                height: 400,
                
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color:
                                index < _rating ? Colors.yellow : Colors.grey,
                          ),
                          onPressed: () {
                            _setRating(index + 1);
                          },
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Row(
                        children: [
                          GestureDetector(
                            onDoubleTap: _editName,
                            child: _isEditing
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: TextField(
                                          controller: _controller,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.check),
                                        onPressed: _saveName,
                                      ),
                                    ],
                                  )
                                : Text(
                                    _name,
                                    style: TextStyle(fontSize: 24),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 350,left: 100),
                            child: GestureDetector(
                              onDoubleTap: _editName2,
                              child: _isEditing2
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: TextField(
                                            controller: _controller2,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.check),
                                          onPressed: _saveName2,
                                        ),
                                      ],
                                    )
                                  : Text(
                                      _name2,
                                      style: TextStyle(fontSize: 10),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
