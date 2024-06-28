//main.dart
// 필요한 패키지들을 가져옵니다.
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/theme.dart';

void main() {
  // MyApp 위젯을 실행합니다.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(), // 테마를 적용합니다.
      home: const ShoppingCartPage(), // ShoppingCartPage 위젯을 홈 화면으로 설정합니다.
    );
  }
}

// StatefulWidget을 사용하여 상태를 관리하는 쇼핑 카트 페이지를 정의합니다.
class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  // StatefulWidget의 상태를 생성합니다.
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

// 실제 상태를 정의하는 클래스입니다.
class _ShoppingCartPageState extends State<ShoppingCartPage> {
  // 현재 선택된 제품 ID를 저장하는 변수입니다.
  int selectedId = 0;

  // 제품 이름과 가격을 리스트로 저장합니다.
  final List<String> productNames = [
    "아디도스 170 리미티드 에디션",
    "나이끼 에어 프로맥스",
    "아가신발",
    "포마 축구화"
  ];
  final List<String> productPrices = [
    "\$10003",
    "\$150",
    "\$120",
    "\$200"
  ];

  // 선택된 제품 ID를 업데이트하는 함수입니다.
  // 이 함수는 사용자가 제품을 선택할 때 호출됩니다.
  void updateProduct(int id) {
    setState(() {
      // setState를 호출하여 상태를 업데이트하고,
      // Flutter가 화면을 다시 그리도록 합니다.
      selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 화면의 구조를 정의합니다.
    return Scaffold(
      appBar: _buildShoppingCartAppBar(), // 앱 바를 생성합니다.
      body: Column(
        children: [
          ShoppingCartHeader(
            initialSelectedId: selectedId, // 현재 선택된 제품 ID를 전달합니다.
            updateProduct: updateProduct, // 제품을 업데이트하는 함수를 전달합니다.
          ),
          Expanded(
            child: ShoppingCartDetail(
              productName: productNames[selectedId], // 선택된 제품의 이름
              productPrice: productPrices[selectedId], // 선택된 제품의 가격
            ),
          ),
        ],
      ),
    );
  }

  // 앱 바를 생성하는 메서드입니다.
  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }
}
