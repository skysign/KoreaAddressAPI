# Git & Github 설정방법

한글주소API(KoreaAddressAPI)를 사용을 위해서도, 함께 개발하기 위해서 필요한 git 및 github 설정방법에 대해서 알아보겠습니다.

# 사전준비
* git을 설치해주세요. https://git-scm.com/
* github.com에 가입해주세요.

# 처음 한번만 실행하는 커맨드
## github.com에서 할일
* 브라우저에서 https://github.com/skysign/KoreaAddressAPI 주소를 입력하고, Star를 클릭하세요, Star를 클릭하면, commit이 추가될 때 마다, 이메일로 알려줍니다.
* Fork도 해주세요 :)

## 내 컴퓨터에서 실행하는 커맨드
git clone을 하고, remote도 추가해주세요.
```
git clone https://github.com/skysign/KoreaAddressAPI.git # fork 한 자신의 git repo를 clone 해야 합니다!
cd KoreaAddressAPI
git remote add upstream https://github.com/skysign/KoreaAddressAPI.git # 병건님의 repo를  upstream으로 지정
```
## remote 저장소 확인 및 upstream 추가
```
$ git remote -v
origin	https://github.com/seongilp/KoreaAddressAPI.git (fetch) -> 자신의 repo 주소가 나와야 합니다
origin	https://github.com/seongilp/KoreaAddressAPI.git (push)
upstream	https://github.com/skysign/KoreaAddressAPI.git (fetch) -> 병건님의 repo 주소가 나와야 합니다
upstream	https://github.com/skysign/KoreaAddressAPI.git (push)
```

## upstream으로 부터 내려받기 (fork 원본 저장소로부터 소스 내려받기)
다른 분들이 변경한 소스가 upstream에 반영되면 내려받기 위한 작업이 필요합니다.
```
$ git fetch upstream
$ git merge upstream/master
$ git push origin master
```
* pull과 fetch의 차이
pull은 소스를 내려와 현재 작업중인 branch에 merge 해주는 것이고, fetch는 내려받고 merge는 하지 않습니다.
git pull은 git fetch + git merge를 동시에 수행하는 것입니다.

## 코드를 수정한 뒤
### commit 부터 우선
```
git add FILENAME_TO_COMMIT
git commit -a -m "커밋 메시지"
// 커밋 메세지를 잘 작성해주세요.
// 이렇게 커밋 메세지를 작성하면, 영원히 고통받습니다. ㅎㅎ
// https://github.com/skysign/KoreaAddressAPI/commit/91eb26573cb0c5ff8e873d927dd5829d2c100ecd
```

### 내 컴퓨터에 있는 repo 에서 github.com에 있는 리포로 보내기
```
git push origin master # origin은 repo, master는 branch 입니다.
```

### fork한 repo에서 https://github.com/skysign/KoreaAddressAPI.git 로 보내기
github.com 에 로그인해서, 'create pull request'를 클릭합니다.

### 끝
