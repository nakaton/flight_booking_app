import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:barcode_widget/barcode_widget.dart';

class FlightInfoPage extends StatefulWidget {
  const FlightInfoPage({super.key});

  @override
  State<FlightInfoPage> createState() => _FlightInfoPageState();
}

class _FlightInfoPageState extends State<FlightInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          "Flight Infomation",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: const [
          // >>> Cloud Background
          CloudBg(),
          // >>> Boeing Background
          BoeingBg(),
          // >>>> Flight Ticket
          FlightTicket(),
        ],
      ),
    );
  }
}

class FlightTicket extends StatelessWidget {
  const FlightTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.25,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Column(
          children: [
            // >>> Ticket digital info
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: const [
                  FlightSchedule(),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey),
                  SizedBox(height: 20),
                  PassengerInfo(),
                  SizedBox(height: 46),
                  BoardInfo(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // >>> Ticket segment line
            const TicketSegmentLine(),
            const TicketBarcode()
          ],
        ),
      ),
    );
  }
}

class TicketBarcode extends StatelessWidget {
  const TicketBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          const SizedBox(height: 25),
          const Text(
            "Scan this barcode!",
            style: TextStyle(color: Color(0xff10A5F9), fontSize: 16),
          ),
          const SizedBox(height: 25),
          BarcodeWidget(
            barcode: Barcode.code128(),
            data: 'Hello Flutter',
            drawText: false,
            height: 70,
            color: Colors.black87,
          )
        ],
      ),
    );
  }
}

class TicketSegmentLine extends StatelessWidget {
  const TicketSegmentLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffE0E5E8),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const DottedLine(dashColor: Colors.grey),
          ),
        ),
        const SizedBox(
          width: 16,
          height: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffE0E5E8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BoardInfo extends StatelessWidget {
  const BoardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Seat",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 6),
            Text("D1"),
          ],
        ),
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Class",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 6),
                Text("Economy"),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "Gate",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 6),
            Text("41"),
          ],
        )
      ],
    );
  }
}

class PassengerInfo extends StatelessWidget {
  const PassengerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Passenger",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Text(
              "Jenny Simmmons",
              style: TextStyle(
                  color: Color(0xff262630),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

class BoeingBg extends StatelessWidget {
  const BoeingBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      right: 50,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 220,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/boeing.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CloudBg extends StatelessWidget {
  const CloudBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cloud.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FlightSchedule extends StatelessWidget {
  const FlightSchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SFO - NYC
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "SFO",
                style: TextStyle(
                  color: Color(0xff10A5F9),
                  fontSize: 34,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "21:30",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Expanded(
            // width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "------- ",
                      style: TextStyle(
                        color: Color(0xff10A5F9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Transform.rotate(
                      angle: math.pi / 2,
                      child: const Icon(Icons.flight,
                          color: Color(0xff10A5F9), size: 34),
                    ),
                    const Text(
                      " -------",
                      style: TextStyle(
                        color: Color(0xff10A5F9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "5h 25m",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "NFC",
                style: TextStyle(
                  color: Color(0xff10A5F9),
                  fontSize: 34,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "05:55",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Sat, 17 Auguest",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
