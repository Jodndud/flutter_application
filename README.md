## flutter_application
플러터 실무적용 적응기

#### 1. 폴더 구조
```
lib/
├── app/
│   ├── router/         # GoRoute 라우트 정의
├── src/
│   ├── /constants      # 상수 정의(AppColor, AppSize, Url, ...)
│   ├── /controller     # 컨트롤러(비즈니스로직, 상태관리, 데이터보관)
│   ├── /models         # 모델 정의
│   ├── /screens        # 페이지
│   ├── /services       # api호출 로직
│   ├── /widgets        # widget 정의
├── main.dart
```

#### 2. 라우트 방식
GoRoute 패키지 이용
1. URL 주소창 처럼 경로를 관리할 수 있음 (예: `/posts/5`)
2. '뒤로 가기' 버튼이나 브라우저의 '앞으로 가기' 처럼 복잡한 스택 제어가 훨씬 정교
3. 딥링크(외부에서 특정 페이지로 바로 들어오는 기능) 처리가 매우 쉬움

#### 3. 상태관리(Riverpod)
`flutter`의 상태관리 라이브러리(`GET`, `BloC`, `Provider` 등) 다양하지만 `Riverpod`은 의존성 주입을 통해 상태를 관리해서 목데이터와 실제 api 데이터를 분리하여 테스트가 용이하고 유지보수가 쉬움
1. 라이브러리 설치
2. 앱 최상단 감싸기
3. 서비스 계층 만들기
4. 프로바이더 선언
5. 컨트롤러 만들기
6. 위젯에서 사용하기

#### 4. api 호출
인터셉터 기능, 에러 타입 세분화 할 수 있는 dio 패키지 이용 예정
[참고 블로그](https://coqoa.tistory.com/197)