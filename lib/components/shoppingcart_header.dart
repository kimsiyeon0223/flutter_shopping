//shoppingcart_header.dart
// 필요한 패키지들을 가져옵니다.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

// ShoppingCartHeader 클래스는 제품의 헤더를 표시하는 위젯입니다.
class ShoppingCartHeader extends StatefulWidget {
  final int initialSelectedId;
  final Function(int) updateProduct;

  const ShoppingCartHeader({
    Key? key,
    required this.initialSelectedId,
    required this.updateProduct,
  }) : super(key: key);

  @override
  _ShoppingCartHeaderState createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  late int selectedId;

  @override
  void initState() {
    super.initState();
    selectedId = widget.initialSelectedId;
  }

  void _updateSelectedId(int id) {
    setState(() {
      selectedId = id;
    });
    widget.updateProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(), // 헤더 이미지 위젯
        _buildHeaderSelector(), // 헤더 선택 버튼 위젯
      ],
    );
  }

  // 헤더 이미지를 표시하는 메서드입니다.
  Widget _buildHeaderPic() {
    // 제품에 따라 다른 이미지를 사용합니다.
    List<String> selectedPic = [
      "assets/womenShoes.webp",
      "assets/manShoes.webp",
      "assets/babyShoes.webp",
      "assets/soccerShoes.webp",
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId], // 선택된 제품의 이미지
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 헤더 선택 버튼을 표시하는 메서드입니다.
  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.woman), // 여성 신발 버튼
          _buildHeaderSelectorButton(1, Icons.man), // 남성 신발 버튼
          _buildHeaderSelectorButton(2, Icons.baby_changing_station), // 아기 신발 버튼
          _buildHeaderSelectorButton(3, Icons.sports_soccer), // 축구 신발 버튼
        ],
      ),
    );
  }

  // 특정 버튼을 생성하는 메서드입니다.
  Widget _buildHeaderSelectorButton(int id, IconData mIcon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor, // 선택된 버튼의 색상 변경
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black), // 버튼 아이콘
        onPressed: () {
          _updateSelectedId(id); // 버튼을 누르면 제품을 업데이트
        },
      ),
    );
  }
}
