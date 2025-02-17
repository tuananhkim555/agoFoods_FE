import 'package:intl/intl.dart';

List<dynamic> categories = [
  {
    '_id': '123',
    'title': 'Cơm tấm',
    'value': 'com_tam',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737427042/images/jmqwfv4zigcufatfakda.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '124',
    'title': 'Lẩu',
    'value': 'mon_lau',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737428014/images/h7r1dkpzpqaqj6apbaml.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '125',
    'title': 'Bánh mì',
    'value': 'banh_mi',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737428357/images/gh926auyztii2cvhyw8b.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '126',
    'title': 'Pizza',
    'value': 'pizza',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737441900/images/figkuplczokv5euzei3i.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '127',
    'title': 'Đồ chiên',
    'value': 'do_chien',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737429079/images/vdenikkwpguy3ohvaege.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '128',
    'title': 'Phở & Bún',
    'value': 'pho_bun',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737429347/images/psaji5zrg53ju9tau23g.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '129',
    'title': 'Hải sản',
    'value': 'hai_san',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737442157/images/dsgfcajzbagd2xbkqpvs.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '130',
    'title': 'Ốc',
    'value': 'oc',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737442543/images/yxnsznhgqyvaxoobbeii.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '131',
    'title': 'Mỳ cay',
    'value': 'my_cay',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737429720/images/ldhd5x3y2tfinawn49gi.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '132',
    'title': 'Mỳ xào',
    'value': 'my_xao',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737429736/images/oq2yyf0b1ulemlkcblxb.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '133',
    'title': 'Đồ nướng',
    'value': 'do_nuong',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737432755/images/nb8oyzcqdqwgsxk6fcpr.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '134',
    'title': 'Bún đậu',
    'value': 'bun_dau_mam_tom',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737431326/images/iozdvnzp3vyj8poonmlu.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
   {
    '_id': '135',
    'title': 'Đồ xào',
    'value': 'do_xao',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737443144/images/gzl4q050lf575upu29ll.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '136',
    'title': 'Bánh ngọt',
    'value': 'banh_ngot',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737433010/images/oq1soepa6xt0yi3f2swx.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '137',
    'title': 'Cafe',
    'value': 'cafe',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737432743/images/ann8qd5s7iqzc4bjxiec.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '138',
    'title': 'Trà sữa',
    'value': 'tra_sua',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737432718/images/obg5xrqsowxm1ag9aamm.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '139',
    'title': 'Sinh tố',
    'value': 'sinh_to',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737432734/images/eia1tkc2ojqieldujuu3.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '140',
    'title': 'Tất cả',
    'value': 'tat_ca',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737431732/images/nasrwhzfrjqncelly7sr.png',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
];

// format price to VND
String formatPriceVND(dynamic price) {
  // If price is already a String, return it
  if (price is String) return price;

  // Convert to number and format
  if (price is num) {
    final numberFormat = NumberFormat('#,###', 'vi_VN');
    return '${numberFormat.format(price)}đ'.replaceAll(',', '.');
  }

  // Return default value if price is invalid
  return '0đ';
}

List<dynamic> restaurants = [
  {
    '_id': '1',
    'title': 'Đồ chiên',
    'time': '6:00 - 22:00',
    'value': 'do_chien',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737373445/images/gzzrgbeqf9kl4q9yxeeh.jpg',
    'owner': '12345akv6343dsbxcz3456',
    'code': '1234523456',
    'logoUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737379545/images/nhwvox2ryniep1cfszh8.png',
    'price': formatPriceVND(550000),
    'rating': 5,
    'ratingCount': 100,
    'coords': {
      'id': '2024',
      'latitude': 10.7765,
      'longitude': 106.7021,
      'address': '27 Lâm Úy, Kiến Giang, Lệ Thủy, Quảng Bình',
      'title': 'Đồ chiên',
      'latitudeDelta': 0.00122,
      'longitudeDelta': 0.00122,
    },
    'description': 'Đồ chiên ngon, ăn là ghiền',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '2',
    'title': 'Bún đậu mắm tôm',
    'time': '6:00 - 22:00',
    'value': 'bun_dau_mam_tom',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737373387/images/gewcfwuxl9v78bk4byfb.jpg',
    'owner': '12345akv6343dsbxcz3456',
    'code': '1234563434',
    'logoUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737379545/images/nhwvox2ryniep1cfszh8.png',
    'price': formatPriceVND(350000),
    'rating': 5,
    'ratingCount': 100,
    'coords': {
      'id': '2025',
      'latitude': 10.7765,
      'longitude': 106.7021,
      'address': '123 Đường Nguyễn Văn Cừ, Kiến Giang, Lệ Thủy, Quảng Bình',
      'title': 'Bún đậu mắm tôm',
      'latitudeDelta': 0.00122,
      'longitudeDelta': 0.00122,
    },
    'description': 'Bún đậu mắm tôm ngon, đậm đà hương vị Hà Nội',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
  {
    '_id': '3',
    'title': 'Bánh mì',
    'time': '6:00 - 22:00',
    'value': 'banh_mi',
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737373364/images/cg84fygdyh0l9tpioss8.jpg',
    'owner': '12345akv6343dsbxcz3456',
    'code': '1234564567',
    'logoUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737379545/images/nhwvox2ryniep1cfszh8.png',
    'price': formatPriceVND(150000),
    'rating': 5,
    'ratingCount': 200,
    'coords': {
      'id': '2022',
      'latitude': 10.7765,
      'longitude': 106.7021,
      'address': '126 Lý Thường Kiệt, Kiến Giang, Lệ Thủy, Quảng Bình',
      'title': 'Bánh mì',
      'latitudeDelta': 0.00122,
      'longitudeDelta': 0.00122,
    },
    'description': 'Bánh mì ngon, đậm đà hương vị ',
    'createdAt': '2025-01-18T00:00:00.000Z',
    'updatedAt': '2025-01-18T00:00:00.000Z',
    '_v': 0,
  },
];

List<dynamic> foods = [
  {
    '_id': '210',
    'title': 'Cơm tấm',
    'foodTags': ['Cơm', 'Tấm', 'Đồ ăn'],
    'foodType': 'com_tam',
    'code': '123456',
    'time': '30 phút',
    'isAvailable': true,
    'restaurant': '12345akv6343dsbxcz3456',
    'rating': 4.9,
    'ratingCount': 400,
    'value': 'com_tam',
    'description': 'Cơm tấm ngon, đậm đà hương vị Lệ Thủy',
    'price': formatPriceVND(25000),
    'additives': [
      {"id": 1, "title": "Cơm Tấm", "price": formatPriceVND(25000)},
      {"id": 2, "title": "Cơm Sườn", "price": formatPriceVND(35000)},
      {"id": 3, "title": "Cơm Gà", "price": formatPriceVND(45000)},
      {"id": 4, "title": "Cơm Cá", "price": formatPriceVND(25000)},
      {"id": 5, "title": "Cơm Bò", "price": formatPriceVND(45000)},
    ],
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737441186/images/wrgaldq1xw8bdvf0fv5g.jpg',
    "__v": 0,
    "category": "com_tam",
    "createdAt": "2025-01-18T00:00:00.000Z",
    "updatedAt": "2025-01-18T00:00:00.000Z",
    "owner": "12345akv6343dsbxcz3456",
  },
   {
    '_id': '211',
    'title': 'Pizza',
    'foodTags': ['Pizza'],
    'foodType': 'pizza',
    'code': '12345642',
    'time': '35 phút',
    'isAvailable': true,
    'restaurant': '12345akv6343dsbxcz3456',
    'rating': 4.9,
    'ratingCount': 400,
    'value': 'pizza',
    'description': 'Pizza ngon, đậm đà hương vị Lệ Thủy',
    'price': formatPriceVND(25000),
    'additives': [
      {"id": 1, "title": "Pizza Hải Sản", "price": formatPriceVND(25000)},
      {"id": 2, "title": "Pizza Bò", "price": formatPriceVND(35000)},
      {"id": 3, "title": "Pizza Gà", "price": formatPriceVND(45000)},
      {"id": 4, "title": "Pizza Cá", "price": formatPriceVND(25000)},
      {"id": 5, "title": "Pizza Bò", "price": formatPriceVND(45000)},
    ],
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737442681/images/uz5rie2auwzbnlee8ddi.jpg',
    "__v": 0,
    "category": "pizza",
    "createdAt": "2025-01-18T00:00:00.000Z",
    "updatedAt": "2025-01-18T00:00:00.000Z",
    "owner": "12345akv6343dsbxcz3456",
  },
   {
    '_id': '212',
    'title': 'Mỳ cay',
    'foodTags': ['Mỳ', 'Cay', 'Đồ ăn'],
    'foodType': 'my_cay',
    'code': '123456432',
    'time': '30 phút',
    'isAvailable': true,
    'restaurant': '12345akv6343dsbxcz3456',
    'rating': 4.9,
    'ratingCount': 400,
    'value': 'my_cay',
    'description': 'Mỳ cay ngon, đậm đà hương vị Lệ Thủy',
    'price': formatPriceVND(25000),
    'additives': [
      {"id": 1, "title": "Mỳ cay size nhỏ", "price": formatPriceVND(25000)},
      {"id": 2, "title": "Mỳ cay size vừa", "price": formatPriceVND(35000)},
      {"id": 3, "title": "Mỳ cay hải sản", "price": formatPriceVND(45000)},
      {"id": 4, "title": "Mỳ cay thập cẩm", "price": formatPriceVND(25000)},
      {"id": 5, "title": "Mỳ cay bò", "price": formatPriceVND(45000)},
    ],
    'imageUrl':
        'https://res.cloudinary.com/agofoods/image/upload/v1737442915/images/wczclokuewzm2zjhditv.jpg',
    "__v": 0,
    "category": "my_cay",
    "createdAt": "2025-01-18T00:00:00.000Z",
    "updatedAt": "2025-01-18T00:00:00.000Z",
    "owner": "12345akv6343dsbxcz3456",
  },
         
];
