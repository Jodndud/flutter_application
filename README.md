## flutter_application
플러터 실무적용 적응기

#### 1. 폴더 구조
```
lib/
├── app/
│   ├── router/         # GoRoute 라우트 정의
├── src/
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

#### 3. dio
적용 예정