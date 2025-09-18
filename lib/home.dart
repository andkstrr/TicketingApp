import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketing_app/payment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> tickets = const [
    {
      'title': 'Tiket untuk Dewasa',
      'type': 'Reguler',
      'price': '300.000',
    },
    {
      'title': 'Tiket untuk Dewasa',
      'type': 'VIP',
      'price': '450.000',
    },
    {
      'title': 'Tiket untuk Anak',
      'type': 'Reguler',
      'price': '150.000',
    },
    {
      'title': 'Tiket untuk Anak',
      'type': 'VIP',
      'price': '250.000',
    },
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true, // title appbar di tengah
        automaticallyImplyLeading: false, // hilangkan back button
        backgroundColor: Colors.white,
        title: Text(
          'Ticketing App',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView.separated(
          itemCount: widget.tickets.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final ticket = widget.tickets[index];
            return _buildTicketCard(
              context,
              title: ticket['title'],
              type: ticket['type'],
              price: ticket['price'],
            );
          },
        ),
      ),
    );
  }

  // listview reusable dari data
  Widget _buildTicketCard(BuildContext context,
    {required String title, required String type, required String price}) {
    return Container(
      height: 153,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              type,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Rp. $price",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage(
                          title: title,
                          type: type,
                          price: price,
                      )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        'Beli',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
            ],
          )
        ]),
      ),
    );
  }
}
