import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketing_app/receipt.dart';

class PopupPayment extends StatelessWidget {
  final String popupTitle;
  final String methodTitle;
  final String methodSubtitle;
  final String imageAsset;
  final String title;
  final String type;
  final String price;

  const PopupPayment({
    super.key,
    required this.popupTitle,
    required this.methodTitle,
    required this.methodSubtitle,
    required this.imageAsset,
    required this.title,
    required this.type,
    required this.price,
  });

  static void show(
    BuildContext context, {
    required String popupTitle,
    required String methodTitle,
    required String methodSubtitle,
    required String imageAsset,
    required String title,
    required String type,
    required String price,
  }) {
    showDialog(
      context: context,
      builder: (context) => PopupPayment(
        popupTitle: popupTitle,
        methodTitle: methodTitle,
        methodSubtitle: methodSubtitle,
        imageAsset: imageAsset,
        title: title,
        type: type,
        price: price,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        width: double.infinity,
        height: 490,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  popupTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[900],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Container(
              width: 185,
              height: 175,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageAsset),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    methodTitle,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    methodSubtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptPage(
                            title: title,
                            type: type,
                            price: price,
                            method: methodSubtitle,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Konfirmasi Pembayaran",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
