import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketing_app/payment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> tickets = const [
    {
      'title': 'Tiket untuk dewasa',
      'type': 'Reguler',
      'price': 300000,
    },
    {
      'title': 'Tiket untuk dewasa',
      'type': 'VIP',
      'price': 450000,
    },
    {
      'title': 'Tiket untuk anak',
      'type': 'Reguler',
      'price': 150000,
    },
    {
      'title': 'Tiket untuk anak',
      'type': 'VIP',
      'price': 250000,
    },
  ];

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
          itemCount: tickets.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final ticket = tickets[index];
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
    {required String title, required String type, required int price}) {
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
                  'Rp. ${price.toString()}',
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
                      MaterialPageRoute(builder: (context) => const PaymentPage()),
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
