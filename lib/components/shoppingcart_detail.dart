import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

// ShoppingCartDetail 클래스는 제품의 세부 사항을 표시하는 위젯입니다.
class ShoppingCartDetail extends StatelessWidget {
  // 제품 이름과 가격을 받습니다.
  final String productName;
  final String productPrice;

  const ShoppingCartDetail({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailNameAndPrice(), // 제품 이름과 가격을 표시하는 위젯
            _buildDetailRatingAndReviewCount(), // 제품의 평점과 리뷰 수를 표시하는 위젯
            _buildDetailColorOptions(), // 색상 옵션을 선택하는 위젯
            _buildDetailButton(context), // "Add to Cart" 버튼을 표시하는 위젯
          ],
        ),
      ),
    );
  }

  // 제품 이름과 가격을 표시하는 메서드입니다.
  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            productPrice,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  // 제품의 평점과 리뷰 수를 표시하는 메서드입니다.
  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow), // 노란색 별 아이콘
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.grey),
          Icon(Icons.star, color: Colors.grey), // 회색 별 아이콘
          Spacer(),
          Text("review "), // "review" 텍스트
          Text("(312)", style: TextStyle(color: Colors.blue)), // 리뷰 수 텍스트
        ],
      ),
    );
  }

  // 색상 옵션을 표시하는 메서드입니다.
  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Color"), // "Select Color" 텍스트
          SizedBox(height: 10), // 여백
          Row(
            children: [
              _buildDetailIcon(Colors.black), // 검은색 아이콘
              _buildDetailIcon(Colors.pink), // 분홍색 아이콘
              _buildDetailIcon(Colors.white), // 흰색 아이콘
            ],
          ),
        ],
      ),
    );
  }

  // 특정 색상 아이콘을 생성하는 메서드입니다.
  Widget _buildDetailIcon(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(
              child: Container(
                color: mColor,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  // "Add to Cart" 버튼을 생성하는 메서드입니다.
  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("장바구니에 담으시겠습니까?"), // "장바구니에 담으시겠습니까?" 텍스트
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("확인", style: TextStyle(color: Colors.blue)), // "확인" 버튼
                ),
              ],
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          "Add to Cart", // "Add to Cart" 텍스트
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
