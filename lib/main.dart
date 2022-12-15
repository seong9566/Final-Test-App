import 'package:flutter/material.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:logger/logger.dart';

void main() => runApp(
      MaterialApp(
        title: '테스트',
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  static const IMP = "imp47718777";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Second Screen'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Payment()));
          },
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: AppBar(
        title: Text('아임포트 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp47718777', // 아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        pg: "kakaopay", // PG상점 아이디 -> 테스트를 위해 임의 생성된 것
        payMethod: "card", // 결제수단
        name: '아임포트 결제데이터 분석', // 주문명
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}', // 주문번호
        amount: 100, // 결제금액
        buyerName: '이현성', // 구매자 이름
        buyerTel: '01012345678', // 구매자 연락처
        buyerEmail: 'example@naver.com', // 구매자 이메일
        buyerAddr: '서울시 강남구 신사동 661-16', // 구매자 주소
        buyerPostcode: '06018', // 구매자 우편번호
        appScheme: 'example', // 앱 URL scheme
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        Logger().d("결제 정보 확인 :  ${result}");
        Navigator.pushReplacementNamed(
          context,
          '/result',
          arguments: result,
        );
      },
    );
  }
}
