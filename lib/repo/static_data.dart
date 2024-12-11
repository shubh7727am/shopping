import 'package:flutter/material.dart';

class StaticDataRepo {
  static final List<Map<String, String>> moreItems = [
    {
      "name": "Lunar Blossom Gown",
      "price": "₹500",
      "image":
          "https://dressblank.com/cdn/shop/files/IMG-0533_700x.jpg?v=1728180956"
    },
    {
      "name": "Velvet Aurora Dress",
      "price": "₹1000",
      "image":
          "https://img.perniaspopupshop.com/catalog/product/n/p/NPNC0623107_1.jpg?impolicy=detailimageprod"
    },
    {
      "name": "Starlit Petal Frock",
      "price": "₹750",
      "image":
          "https://media.6media.me/media/catalog/product/f/s/fs-28353711_f.jpg"
    },
    {
      "name": "Dreamcatcher Tunic",
      "price": "₹1200",
      "image":
          "https://www.koakhofficial.com/cdn/shop/files/KO_3933_1624f96e-960e-4cf5-8ef9-5c3fb60606e9.jpg?v=1716448380"
    },
    {
      "name": "Golden Whisper Dress",
      "price": "₹300",
      "image":
          "https://www.forevernew.co.in/pub/media/catalog/product/o/l/oldimlall_onbody_28353704_f.jpg"
    },
    {
      "name": "Crystal Meadow Dress",
      "price": "₹850",
      "image":
          "https://img2.ogaanindia.com/pub/media/catalog/product/cache/fd086aca531763fef1ed6109e649eb79/1/_/1_42646.jpg"
    },
  ];
  static final Map<String, dynamic> deliveryConfig = {
    "freeDes":
        "Free shipping on this product. Save ₹99. Estimated delivery by Tue, 26 Mar - Thu, 28 Mar."
  };
  static final Map<String, dynamic> productDetails = {
    "name": "Printed Slip Dress",
    "about" : "This slip dress is made of satin and features a printed design. Perfect for any occasion.",
    "washCare" : "Machine wash cold. Do not bleach. Tumble dry low.",
    "service" : "Returns accepted within 30 days of delivery. For more details, refer to our policy.",
    "price": "2300",
    "discount": "40",
    "shortDes":
        "Short slip dress made of satin, featuring a flared A-line silhouette with a printed design detail. Sleeveless with spaghetti straps for a feminine look.",
    "colors": [Colors.pink, Colors.black]
  };
  static final List<Map<String, dynamic>> reviews = [
    {
      "name": "Sofia",
      "date": "date of purchase",
      "rating": 4,
      "title": "Highly recommended",
      "review":
          "Ut aliquet venenatis elit, at condimentum mi bibendum non. Highly recommended!",
    },
    {
      "name": "Emily",
      "date": "date of purchase",
      "rating": 5,
      "title": "Nice Buy",
      "review":
          "Loved this product! The quality is amazing. Would definitely buy again.",
    },
    {
      "name": "John",
      "date": "date of purchase",
      "title": "Splendid Purchase",
      "rating": 3,
      "review":
          "The product is decent, but the shipping took longer than expected.",
      "images": [
        "https://assets.ajio.com/medias/sys_master/root/20240116/jYf7/65a66ba58cdf1e0df5b95bfe/-473Wx593H-442347928-black-MODEL.jpg",
        "https://assets.ajio.com/medias/sys_master/root/20240116/jYf7/65a66ba58cdf1e0df5b95bfe/-473Wx593H-442347928-black-MODEL.jpg",
      ]
    },
  ];
  static final List<String> reviewImages = [
    "https://www.libas.in/cdn/shop/files/5_0e273472-8125-4f6b-b994-0223f68a2881.jpg?v=1725347718&width=1800",
    "https://www.libas.in/cdn/shop/files/29165_1.jpg?v=1725610995&width=1800",
    "https://www.libas.in/cdn/shop/files/2_5b990b89-ac3f-4b23-b7e3-26dd72cd0aa9.jpg?v=1726044015&width=1800",
    "https://www.libas.in/cdn/shop/files/5_b2be5998-6414-4525-a34c-cae7b8c8e597.jpg?v=1718781931&width=1800",
    "https://assets.ajio.com/medias/sys_master/root/20240116/jYf7/65a66ba58cdf1e0df5b95bfe/-473Wx593H-442347928-black-MODEL.jpg",
    "https://assets.ajio.com/medias/sys_master/root/20240116/jYf7/65a66ba58cdf1e0df5b95bfe/-473Wx593H-442347928-black-MODEL.jpg"
  ];
  static final List<String> imageUrls = [
    'https://assets.ajio.com/medias/sys_master/root/20240116/jYf7/65a66ba58cdf1e0df5b95bfe/-473Wx593H-442347928-black-MODEL.jpg',
    'https://assets.ajio.com/medias/sys_master/root/20231205/8Q2c/656f3cf0afa4cf41f5b5d56b/-473Wx593H-442347928-black-MODEL4.jpg',
    'https://assets.ajio.com/medias/sys_master/root/20231205/hzzs/656f41a0ddf7791519b2e688/-473Wx593H-442347928-black-MODEL3.jpg',
  ];
}
