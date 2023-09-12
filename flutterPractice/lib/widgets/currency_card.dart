import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {

  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  final _blackColor = const Color((0xFF1F2123));

  CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order*(-20)),
      child: Container(
        clipBehavior: Clip.hardEdge, // 카드 밖에 넘어가면 cutting
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text(amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(code,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,

                /// 부모의 영향 전혀 받지 않은 크기 조정
                child: Transform.translate(
                  offset: Offset(-5, 12),
                  child: Icon(icon,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
