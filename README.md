# 한국주소API (KoreaAddressAPI)
R 에서 한국 주소를 다루기 위한 Package 입니다.

```
library(KoreaAddressAPI)

dirtyJuso = c('서울특별시 \n\t   동작구 | |   사당동',
              '서울특별시 없는구 자당동')
dfDirtyJuso = data.frame(dirtyJuso)
dfDirtyJuso
#>                               dirtyJuso
#> 1 서울특별시 \n\t   동작구 | |   사당동
#> 2              서울특별시 없는구 자당동

dfCleaned = KAParse(dfDirtyJuso)
dfCleaned
#>                               dirtyJuso SiDoMyeong SiGunGuMyeong BeopJeongEupMyeonDongMyeong
#> 1 서울특별시 \n\t   동작구 | |   사당동 서울특별시        동작구                      사당동
#> 2              서울특별시 없는구 자당동          x             x                           x
```
# 새소식
## 0.1.0 릴리즈
- KAPrase()
 - 서울시 주소만 지원
 - 시도/군구/동 까지 주소를 구분 가능함

# 프로젝트를 시작하게된 이유는..?
이 책으로 ↓ [DAT스터디](https://skysign.github.io/DAT/)를 진행하고 있었습니다. <br>
https://book.naver.com/bookdb/book_detail.nhn?bid=12256508

* 서로 열씸히 공부하였지만, 아직 R 코드는 익숙하지 않았어요
* R 코딩이 익숙하지 않아, 큰 데이터를 다루는게 힘들었어요
* Data Analysis는 아주 큰 데이터를 다뤄야 하는 **숙명**이 있습니다.
* 그러면, '데이터는 아주 큰대, 사람이 읽기 쉬운 데이터로 프로젝트를 하면 어떨까?'
* '그런 데이터가 뭐가 있을까?'
* 고민을 거듭한 끝에, '주소데이터가 우리에게 적합하겠구나!'

# FAQ

## 한국주소 rest API가 있지 않을까?
한국주소 rest API가 없다는걸 최근에 알게 되었어요.
* 다음에서 제공하는 주소API는 매우 좋지만, rest API가 없어요. 자세한 내용은 [여기 참고](https://github.com/daumPostcode/QnA#4-rest-api%EB%A1%9C%EB%8F%84-%EC%A0%9C%EA%B3%B5%ED%95%98%EA%B3%A0-%EC%9E%88%EB%82%98%EC%9A%94)하세요
* Toast 에서도 한국주소 API는 판매가 중지 되었습니다. 자세한 내용은 [여기 참고](https://www.toast.com/kr/support/notice/detail/1331)하세요
* juso.go.kr에서 제공하는 rest API가 있기는 했지만, 사용자가 입력한 에러가 있는 주소를 잘 처리해주지 못했습니다.

**결론! 없으면 만든다. :-)**

## juso.go.kr에서 제공하는 데이터의 저작권에 따라 사용에 제한이 있지 않을까요?

**공공데이터법에 근거하여 공공데이터는 누구나 이용가능하고, 영리 목적의 이용을 포함한 자유로운 활용이 보장되므로 목적에 맞게 활용하시기 바랍니다.**
- 이렇게 답변 되어 있습니다. ^^
- 출처 : https://www.juso.go.kr/addrlink/DevCenterQABoardDetail.do?mgtSn=36836&currentPage=1&searchType=subject&keyword=%EC%A0%80%EC%9E%91

---

# 만든 사람들
한국주소API(KoreaAddressAPI)는 DAT스터디에서 개발하였습니다.
 https://skysign.github.io/DAT ← 여기 참고하세요

---

# 데이터 출처
이 프로젝트에 사용된 모든 주소/도로명/건물/상세주소 등의 데이터는 http://www.juso.go.kr/ 에서 제공하는 데이터를 사용하였습니다.

---
