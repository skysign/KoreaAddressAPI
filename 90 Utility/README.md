# 입력 데이터 클리닝

입력받는 데이터는 다양한 에러를 포함 데이터가 들어 올 수 있어서, 기본적인 클리닝이 필요합니다.

* 데이터의 시작과 끝에는 어떤 whitespace charater도 없게 삭제
* 데이터는 연속된 2개의 이상의 빈칸 ' '' '은 모두 ' ' 한개의 빈칸으로 변경
* string tokenizing 여기 참고 https://www.rdocumentation.org/packages/readr/versions/1.3.1/topics/tokenize
* tokenizer를 ' '으로 해서, 길이가 0 인 스트링은 삭제


* 샘플 입력 예

서울특별시 &nbsp;&nbsp; 광진구
(서울과 광진구 사이에 빈칸이 여러개 있음)

* 샘플 출력 예

서울특별시 광진구
(서울과 광진구 사이에 빈칸이 1개만 있음)

---

**“데이터 과학의 80%는 데이터 클리닝(전처리)에 소비되고, 나머지 20%는 이를 불평하는 데 쓰인다”는 캐글(Kaggle) 창립자 앤서니 골드블룸(Anthony Goldbloom)의 말**

출처 https://dbr.donga.com/article/view/1201/article_no/9102

---
