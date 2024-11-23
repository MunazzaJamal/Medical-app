import 'package:flutter/material.dart';
import 'package:med_app/login.dart';
import 'package:med_app/prodDetails.dart';

List<Map<String, dynamic>> cartProducts = [];
List<Map<String, dynamic>> medicalProducts = [
  {
    "title": "Sugar Free Gold",
    "subtitle": "Low-Calorie Sweetener for Healthier Living",
    "price": 250.00,
    "company": "Sugar Free India Ltd.",
    "productDetails":
        "Sugar Free Gold is a low-calorie sugar substitute made from Aspartame. Suitable for diabetics and fitness enthusiasts.",
    "ingredients": ["Aspartame", "Lactose", "Flavors"],
    "expiryDate": "2026-05-15",
    "brandName": "Sugar Free",
    "rating": 4.5,
    'image': 'prod1.jpg',
    "quantity": 1,
    "packageSizes": [
      {"size": "100g", "price": 250.00},
      {"size": "200g", "price": 450.00},
      {"size": "500g", "price": 1050.00}
    ],
    "reviews": [
      {
        "reviewer": "Rahul",
        "comment": "Great alternative to sugar!",
        "rating": 5
      },
      {"reviewer": "Neha", "comment": "Works well in my coffee.", "rating": 4},
    ],
  },
  {
    "title": "Dabur Glucose-D",
    "subtitle": "Essential Glucose Powder for Instant Energy",
    "price": 180.00,
    "company": "Dabur India",
    "productDetails":
        "Dabur Glucose-D provides instant energy and is enriched with Vitamin D and Calcium for better immunity and bone health.",
    "ingredients": ["Glucose", "Vitamin D", "Calcium"],
    "expiryDate": "2025-03-10",
    "brandName": "Dabur Glucose-D",
    "rating": 4.7,
    'image': 'prod2.jpg',
    "quantity": 1, // Initial quantity is 0
    "packageSizes": [
      {"size": "500g", "price": 180.00},
      {"size": "1kg", "price": 350.00},
      {"size": "2kg", "price": 650.00}
    ],
    "reviews": [
      {"reviewer": "Rohit", "comment": "Perfect for summer days.", "rating": 5},
      {"reviewer": "Asha", "comment": "Great energy booster.", "rating": 4.6},
    ],
  },
  {
    "title": "Electral Powder",
    "subtitle": "Electrolyte Supplement for Rehydration",
    "price": 50.00,
    "company": "FDC Limited",
    "productDetails":
        "Electral Powder is an oral rehydration salt (ORS) recommended for quick recovery from dehydration caused by diarrhea or heat.",
    "ingredients": ["Dextrose", "Sodium Chloride", "Potassium Chloride"],
    "expiryDate": "2025-11-30",
    "brandName": "Electral",
    "rating": 4.8,
    'image': 'prod3.jpg',
    "quantity": 1, // Initial quantity is 0
    "packageSizes": [
      {"size": "100g", "price": 50.00},
      {"size": "200g", "price": 90.00},
      {"size": "500g", "price": 200.00}
    ],
    "reviews": [
      {
        "reviewer": "Kiran",
        "comment": "Works like magic during dehydration.",
        "rating": 5
      },
      {"reviewer": "Manoj", "comment": "Always keep it handy.", "rating": 4.7},
    ],
  },
  {
    "title": "Amrutanjan Pain Balm",
    "subtitle": "Pain Relief Balm for Muscular Aches",
    "price": 120.00,
    "company": "Amrut Healthcare Ltd.",
    "productDetails":
        "Amrutanjan Pain Balm is a trusted remedy for headaches and muscular pain. Provides instant relief with its strong menthol aroma.",
    "ingredients": ["Menthol", "Camphor", "Thymol"],
    "expiryDate": "2027-02-15",
    "brandName": "Amrutanjan",
    "rating": 4.6,
    'image': 'prod4.jpg',
    "quantity": 1, // Initial quantity is 0
    "packageSizes": [
      {"size": "30g", "price": 120.00},
      {"size": "50g", "price": 200.00},
      {"size": "100g", "price": 350.00}
    ],
    "reviews": [
      {
        "reviewer": "Vikas",
        "comment": "Relieves headaches quickly.",
        "rating": 4.8
      },
      {
        "reviewer": "Suman",
        "comment": "Effective and long-lasting.",
        "rating": 4.5
      },
    ],
  },
  {
    "title": "Dettol Antiseptic Liquid",
    "subtitle": "Antiseptic Liquid for First Aid",
    "price": 200.00,
    "company": "Reckitt Benckiser",
    "productDetails":
        "Dettol Antiseptic Liquid provides protection against germs and infections. Ideal for first aid, cleaning wounds, and personal hygiene.",
    "ingredients": ["Chloroxylenol", "Isopropyl Alcohol"],
    "expiryDate": "2026-09-20",
    "brandName": "Dettol",
    "rating": 4.9,
    'image': 'prod5.png',
    "quantity": 1, // Initial quantity is 0
    "packageSizes": [
      {"size": "250ml", "price": 200.00},
      {"size": "500ml", "price": 350.00},
      {"size": "1L", "price": 650.00}
    ],
    "reviews": [
      {
        "reviewer": "Amit",
        "comment": "A must-have in every home.",
        "rating": 5
      },
      {
        "reviewer": "Anjali",
        "comment": "Reliable for cleaning wounds.",
        "rating": 4.9
      },
    ],
  },
  {
    "title": "Vicks Vaporub",
    "subtitle": "Cold and Cough Relief Ointment",
    "price": 160.00,
    "company": "Procter & Gamble",
    "productDetails":
        "Vicks Vaporub provides effective relief from cold, cough, and nasal congestion with a soothing menthol and eucalyptus formulation.",
    "ingredients": ["Menthol", "Camphor", "Eucalyptus Oil"],
    "expiryDate": "2027-04-25",
    "brandName": "Vicks",
    "rating": 4.7,
    'image': 'prod6.png',
    "quantity": 1, // Initial quantity is 0
    "packageSizes": [
      {"size": "50g", "price": 160.00},
      {"size": "100g", "price": 300.00},
      {"size": "150g", "price": 450.00}
    ],
    "reviews": [
      {
        "reviewer": "Priya",
        "comment": "Works wonders for cold and cough.",
        "rating": 5
      },
      {
        "reviewer": "Sandeep",
        "comment": "Quick relief from nasal congestion.",
        "rating": 4.5
      },
    ],
  },
];

Widget topcategories(clr, txt) {
  return Container(
    width: 73.17,
    height: 120,
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(70)),
    child: Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
            height: 58.78,
            width: 54.88,
            child: CircleAvatar(
              backgroundColor: clr,
            )),
        Text(
          txt,
          style: const TextStyle(
            fontSize: 11,
          ),
        )
      ],
    ),
  );
}

Widget customProd(prod, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigate to LoginScreen when tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen(prod)),
      );
    },
    child: Column(
      children: [
        Container(
          width: 159.93,
          height: 147.22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            image: DecorationImage(
                image: AssetImage(prod['image']), fit: BoxFit.cover),
          ),
        ),
        Container(
            width: 159.93,
            height: 95,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 5),
                Text('${prod['title']}'),
                const SizedBox(height: 5),
                Text('${prod['company']}'),
                const SizedBox(height: 5),
                Text('${prod['price']}'),
              ],
            )),
      ],
    ),
  );
}

Widget gridview(List prod) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: prod.length,
      itemBuilder: (context, index) {
        return customProd(prod[index], context);
      },
    ),
  );
}

Widget Screen(message) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
