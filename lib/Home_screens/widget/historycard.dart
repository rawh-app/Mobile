import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  Widget buildItem(String title, String date, Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(224, 234, 242, 249),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // التاريخ
            Text(date, style: const TextStyle(color: Color(0xff123655))),

            // الجزء اللي فيه الديفايدر + الحالة
            Row(
              children: [
                VerticalDivider(
                  color: Colors.grey.shade400,
                  thickness: 1,
                  width: 20,
                ),

                Icon(icon, size: 20, color: color),
                const SizedBox(width: 6),

                Text(
                  title,
                  style: GoogleFonts.tajawal(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/medical-records.png', width: 20, height: 20),
              SizedBox(width: 5),
              Text(
                "سجل الفحوصات :",
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff123655),
                ),
              ),
            ],
          ),
          Divider(endIndent: 20),
          const SizedBox(height: 10),
          buildItem(
            "جيد",
            "اليوم 10:30",
            Color(0xff006802),
            Icons.check_circle,
          ),
          buildItem("متوسطة", "أمس 12:13", Color(0xffF8A900), Icons.warning),
          buildItem("سيئة", "11/4 12:13", Color(0xffE20E0E), Icons.cancel),
        ],
      ),
    );
  }
}
