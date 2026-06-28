import '../models/product.dart';

const List<String> categories = [
  'All',
  'Electronics',
  'Fashion',
  'Home & Living',
  'Sports',
  'Beauty',
];

String _imageFor(String seed) => 'https://picsum.photos/seed/$seed/600/600';

final List<Product> mockProducts = [
  Product(
    id: 'p1',
    name: 'Wireless Headphones',
    category: 'Electronics',
    price: 8990,
    rating: 4.5,
    description:
        'Over-ear wireless headphones with active noise cancellation, '
        '30-hour battery life, and plush memory-foam ear cushions for '
        'all-day comfort.',
    imageUrl: _imageFor('headphones'),
  ),
  Product(
    id: 'p2',
    name: 'Smart Watch Series 5',
    category: 'Electronics',
    price: 15990,
    rating: 4.7,
    description:
        'Track your fitness, heart rate, and sleep with this sleek smart '
        'watch. Water-resistant and compatible with iOS and Android.',
    imageUrl: _imageFor('smartwatch'),
  ),
  Product(
    id: 'p3',
    name: 'Bluetooth Speaker',
    category: 'Electronics',
    price: 5490,
    rating: 4.2,
    description:
        'Portable speaker with rich bass, 12-hour playtime, and an IPX7 '
        'waterproof rating — perfect for the beach or a backyard party.',
    imageUrl: _imageFor('speaker'),
  ),
  Product(
    id: 'p4',
    name: 'Mechanical Keyboard',
    category: 'Electronics',
    price: 12490,
    rating: 4.6,
    description:
        'RGB-backlit mechanical keyboard with tactile switches, durable '
        'aluminum frame, and detachable USB-C cable.',
    imageUrl: _imageFor('keyboard'),
  ),
  Product(
    id: 'p5',
    name: 'Classic Denim Jacket',
    category: 'Fashion',
    price: 6990,
    rating: 4.3,
    description:
        'A timeless denim jacket with a relaxed fit, button closures, and '
        'durable stitching that only gets better with age.',
    imageUrl: _imageFor('jacket'),
  ),
  Product(
    id: 'p6',
    name: 'Running Sneakers',
    category: 'Fashion',
    price: 9490,
    rating: 4.4,
    description:
        'Lightweight running sneakers with breathable mesh uppers and '
        'cushioned soles built for long-distance comfort.',
    imageUrl: _imageFor('sneakers'),
  ),
  Product(
    id: 'p7',
    name: 'Leather Crossbody Bag',
    category: 'Fashion',
    price: 7290,
    rating: 4.1,
    description:
        'Genuine leather crossbody bag with adjustable strap and multiple '
        'compartments for everyday essentials.',
    imageUrl: _imageFor('bag'),
  ),
  Product(
    id: 'p8',
    name: 'Aviator Sunglasses',
    category: 'Fashion',
    price: 3490,
    rating: 4.0,
    description:
        'UV-protected aviator sunglasses with a polished metal frame and '
        'polarized lenses to cut glare on bright days.',
    imageUrl: _imageFor('sunglasses'),
  ),
  Product(
    id: 'p9',
    name: 'Ceramic Coffee Mug Set',
    category: 'Home & Living',
    price: 2290,
    rating: 4.6,
    description:
        'Set of four hand-glazed ceramic mugs, microwave and dishwasher '
        'safe, perfect for your morning coffee ritual.',
    imageUrl: _imageFor('mug'),
  ),
  Product(
    id: 'p10',
    name: 'Scented Soy Candle',
    category: 'Home & Living',
    price: 1690,
    rating: 4.4,
    description:
        'Hand-poured soy wax candle with a warm vanilla-sandalwood scent '
        'and a 45-hour burn time.',
    imageUrl: _imageFor('candle'),
  ),
  Product(
    id: 'p11',
    name: 'Indoor Plant Pot',
    category: 'Home & Living',
    price: 1990,
    rating: 4.3,
    description:
        'Minimalist ceramic plant pot with drainage hole and bamboo tray, '
        'ideal for succulents and small houseplants.',
    imageUrl: _imageFor('plantpot'),
  ),
  Product(
    id: 'p12',
    name: 'Yoga Mat',
    category: 'Sports',
    price: 3290,
    rating: 4.5,
    description:
        'Extra-thick non-slip yoga mat with carrying strap, made from '
        'eco-friendly TPE material for cushioned support.',
    imageUrl: _imageFor('yogamat'),
  ),
  Product(
    id: 'p13',
    name: 'Adjustable Dumbbell Set',
    category: 'Sports',
    price: 18990,
    rating: 4.7,
    description:
        'Space-saving adjustable dumbbells ranging from 2.5kg to 24kg per '
        'hand, with a quick-change weight selector dial.',
    imageUrl: _imageFor('dumbbell'),
  ),
  Product(
    id: 'p14',
    name: 'Insulated Water Bottle',
    category: 'Sports',
    price: 2490,
    rating: 4.6,
    description:
        'Double-wall vacuum insulated bottle that keeps drinks cold for '
        '24 hours or hot for 12, leak-proof lid included.',
    imageUrl: _imageFor('bottle'),
  ),
  Product(
    id: 'p15',
    name: 'Vitamin C Serum',
    category: 'Beauty',
    price: 3990,
    rating: 4.5,
    description:
        'Brightening vitamin C serum with hyaluronic acid to even skin '
        'tone and boost hydration, suitable for all skin types.',
    imageUrl: _imageFor('serum'),
  ),
  Product(
    id: 'p16',
    name: 'Natural Bristle Hair Brush',
    category: 'Beauty',
    price: 1490,
    rating: 4.2,
    description:
        'Boar-bristle brush that gently detangles, reduces frizz, and '
        'distributes natural oils for healthier-looking hair.',
    imageUrl: _imageFor('hairbrush'),
  ),
];
