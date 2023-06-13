import 'package:flutter/material.dart';

import '../util/listtiles.dart';

class FinancialAidPage extends StatefulWidget {
  const FinancialAidPage({Key? key}) : super(key: key);

  @override
  State<FinancialAidPage> createState() => _FinancialAidPageState();
}

class _FinancialAidPageState extends State<FinancialAidPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.antiAlias,
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'How to Apply',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(''),
                  ),
                ],
              ),
            ),
          ]
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height/15,
            width: MediaQuery.of(context).size.width/1.5,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
              ),
              onPressed: () {

              },
              child: const Text('Apply Now', style: TextStyle(
                fontSize: 20
              ),)
            ),
          ),
        )
      ],
    );
  }
}
