# Git & Github 설정방법

한글주소API(KoreaAddressAPI)를 사용을 위해서도, 함께 개발하기 위해서 필요한 git 및 github 설정방법에 대해서 알아보겠습니다.

# 사전준비
* git을 설치해주세요. https://git-scm.com/
* githube.com에 가입해주세요.
*

# 처음 한번만 실행하는 커맨드
## github.com에서 할일
* 브라우저에서 https://github.com/skysign/KoreaAddressAPI 주소를 입력하고, Star를 클릭하세요, Star를 클릭하면, commit이 추가될 때 마다, 이메일로 알려줍니다.
* Fork도 해주세요 :)

## 내 컴퓨터에서 실행하는 커맨드
git clone을 하고, remote도 추가해주세요.
```
git clone https://github.com/skysign/KoreaAddressAPI.git
cd KoreaAddressAPI
git remote add origin https://github.com/skysign/KoreaAddressAPI.git
```

## 코드를 수정한 뒤
### commit 부터 우선
```
git add filename_to_commit
git commit
// 커밋 메세지를 잘 작성해주세요.
// 이렇게 커밋 메세지를 작성하면, 영원히 고통받습니다. ㅎㅎ
// https://github.com/skysign/KoreaAddressAPI/commit/91eb26573cb0c5ff8e873d927dd5829d2c100ecd
```

### 내 컴퓨터에 있는 repo 에서 github.com에 있는 리포로 보내기
```
git push origin master
```

### fork한 repo에서 https://github.com/skysign/KoreaAddressAPI.git 로 보내기
github.com 에 로그인해서, 'create pull request'를 클릭합니다.

### 끝
