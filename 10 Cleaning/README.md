# 데이터 클리닝

juso.go.kr 폴더에는 http://www.juso.go.kr 에서 받은 원본 데이터가 들어 있습니다.
R에서 사용하기 위해서, 데이터프레임으로 변환이 필요합니다.

* Cleanning이 끝난 데이터는 data 폴더에 넣어 줍니다.
* 한글을 데이터프레임의 컬럼이름 사용하면, 사용하기 어려워서, 영문 컬럼명으로 변경해야 합니다.
* 한글 컬럼이름은 [가이드]주소DB 활용방법.pdf 참고
* 한글을 영문으로 자동변환해주는 사이트 https://www.lexilogos.com/keyboard/korean_conversion.htm
* 한글의 첫글자는 대문자로 변환해서, 읽기 쉽게 해주세요.
* 관리번호 → GwanRiBeonHo

---

**“데이터 과학의 80%는 데이터 클리닝(전처리)에 소비되고, 나머지 20%는 이를 불평하는 데 쓰인다”는 캐글(Kaggle) 창립자 앤서니 골드블룸(Anthony Goldbloom)의 말**

출처 https://dbr.donga.com/article/view/1201/article_no/9102

---
