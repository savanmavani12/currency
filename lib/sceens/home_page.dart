import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  String from = "INR";
  String to = "USD";

  List? data;

  get() async {
    String deCode = await rootBundle.loadString("assets/jsonData.json");
    setState(() {
      data = jsonDecode(deCode);
    });
  }

  @override
  void initState() {
    get();
    fromController.text = "0";
    toController.text = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "From",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonFormField(
                        onChanged: (val) {
                          setState(() {
                            from =  val.toString();
                          },);
                        },
                        focusColor: Colors.orange,
                        dropdownColor: Colors.white,
                        value: from,
                        items: data!
                            .map(
                              (e) => DropdownMenuItem(
                                value: e["currencyCode"],
                                child: Text(e["countryName"]),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "rupees>",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            controller: fromController,
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            icon: const Icon(
                              Icons.arrow_circle_down,
                              color: Colors.white,
                              size: 28,
                            ),
                            focusColor: Colors.orange,
                            dropdownColor: Colors.white,
                            items: data!
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e["currencyCode"],
                                    child: Text(e["countryName"]),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {}),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Use >",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            controller: toController,
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.orange)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: const [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
