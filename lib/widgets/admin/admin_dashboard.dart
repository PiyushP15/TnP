import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

int a = 0;
Future<void> getCount() async {
    final url = Uri.https(
        'tnp-portal-63ea2-default-rtdb.firebaseio.com', 'register.json');
    final getResponse = await http.get(url);
    final Map getData = json.decode(getResponse.body);
    
    for (final x in getData.entries) {
      a = a + 1;
    }
    print(a);
  }
class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});


  @override
  Widget build(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List dummyData = [
      ['TCS', '42', '09'],
      ['Cognizant', '69', '20'],
      ['Wipro', '69', '20'],
      ['IntegriChain', '69', '20'],
      ['Kanaka', '69', '20'],
      ['Accenture', '69', '20'],
    ];
<<<<<<< HEAD
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/latestlogopccoe.png'),
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          repeat: ImageRepeat.noRepeat,
          opacity: 0.5,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF96031A)),
=======
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF96031A)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Card(
                        color: const Color(0XFFFAA916),
                        margin: screenWidth > 1080
                            ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                            : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  const Row(
                                    children: [
                                      SizedBox(
                                        // width: 150,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Registered Users",
                                            style: TextStyle(
                                              color: Color(0xFF96031A),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          a.toString(),
                                          style: const TextStyle(
                                            color: Color(0xFF96031A),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: const Color(0XFFFAA916),
                        margin: screenWidth > 1080
                            ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                            : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        // width: 150,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Total Job Offers",
                                            style: TextStyle(
                                              color: Color(0xFF96031A),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          "69",
                                          style: TextStyle(
                                            color: Color(0xFF96031A),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: const Color(0XFFFAA916),
                        margin: screenWidth > 1080
                            ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                            : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        // width: 150,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Total Applications",
                                            style: TextStyle(
                                              color: Color(0xFF96031A),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          "69",
                                          style: TextStyle(
                                            color: Color(0xFF96031A),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
>>>>>>> 41640b8ea36cb5d4259d3599170fb076aeb55798
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
=======
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'Company Wise Data',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF96031A)),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
>>>>>>> 41640b8ea36cb5d4259d3599170fb076aeb55798
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Card(
                          color: const Color(0XFFFAA916),
                          margin: screenWidth > 1080
                              ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                              : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        SizedBox(
                                          // width: 150,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Registered Users",
                                              style: TextStyle(
                                                color: Color(0xFF96031A),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "69",
                                            style: TextStyle(
                                              color: Color(0xFF96031A),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    Column(
                      children: [
                        Card(
                          color: const Color(0XFFFAA916),
                          margin: screenWidth > 1080
                              ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                              : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        SizedBox(
                                          // width: 150,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Total Job Offers",
                                              style: TextStyle(
                                                color: Color(0xFF96031A),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "69",
                                            style: TextStyle(
                                              color: Color(0xFF96031A),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          color: const Color(0XFFFAA916),
                          margin: screenWidth > 1080
                              ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                              : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        SizedBox(
                                          // width: 150,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "Total Applications",
                                              style: TextStyle(
                                                color: Color(0xFF96031A),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "69",
                                            style: TextStyle(
                                              color: Color(0xFF96031A),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Company Wise Data',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF96031A)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Company',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF96031A)),
                        ),
                      ),
                      SizedBox(width: screenWidth < 1080 ? 100 : 950),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Applied',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF96031A)),
                        ),
                      ),
                      SizedBox(width: screenWidth < 1080 ? 10 : 70),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Placed',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF96031A)),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   'NOTE',
                  //   style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.4)),

                  // ),
                  // Text(
                  //   'The Admin Dashboard is disabled as off now!',
                  //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.4)),

                  // ),
                ],
              ),
            ),
            SizedBox(
              height: screenWidth < 1080 ? 300 : 500,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dummyData.length,
                itemBuilder: (ctx, index) => Card(
                  color: const Color(0XFFFAA916),
                  margin: screenWidth > 1080
                      ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                      : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: screenWidth < 1080 ? 150 : 500,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      dummyData[index][0],
                                      style: const TextStyle(
                                        color: Color(0xFF96031A),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
=======
                    SizedBox(width: screenWidth < 1080 ? 100 : 950),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'Applied',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF96031A)),
                      ),
                    ),
                    SizedBox(width: screenWidth < 1080 ? 10 : 70),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'Placed',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF96031A)),
                      ),
                    ),
                  ],
                ),
                // Text(
                //   'NOTE',
                //   style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.4)),

                // ),
                // Text(
                //   'The Admin Dashboard is disabled as off now!',
                //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.4)),

                // ),
              ],
            ),
          ),
          SizedBox(
            height: screenWidth < 1080 ? 300 : 500,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dummyData.length,
              itemBuilder: (ctx, index) => Card(
                color: const Color(0XFFFAA916),
                margin: screenWidth > 1080
                    ? const EdgeInsets.fromLTRB(150, 5, 150, 5)
                    : const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: screenWidth < 1080 ? 150 : 500,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    dummyData[index][0],
                                    style: const TextStyle(
                                      color: Color(0xFF96031A),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
>>>>>>> 41640b8ea36cb5d4259d3599170fb076aeb55798
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                dummyData[index][1],
                                style: const TextStyle(
                                  color: Color(0xFF96031A),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
<<<<<<< HEAD
                            SizedBox(
                              width: screenWidth < 1080 ? 40 : 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                dummyData[index][2],
                                style: const TextStyle(
                                  color: Color(0xFF96031A),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth < 1080 ? 10 : 20,
                            ),
                          ],
                        ),
                      ],
                    ),
=======
                          ),
                          SizedBox(
                            width: screenWidth < 1080 ? 40 : 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              dummyData[index][2],
                              style: const TextStyle(
                                color: Color(0xFF96031A),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth < 1080 ? 10 : 20,
                          ),
                        ],
                      ),
                    ],
>>>>>>> 41640b8ea36cb5d4259d3599170fb076aeb55798
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
