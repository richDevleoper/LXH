# LX하우시스 혁신지원시스템 구축
### 기간 : 2023. 1. 1 ~ 6. 29
### Spring Framework 기반 구축
https://drive.google.com/drive/folders/1ffc5lEtp7nm8Ja8UU6UaAd8iQe3OpMAb?usp=sharing

## 개발환경 구축

1. 세팅

1-1)
깃허브계정 박과장 전달해주면,
레파지토리 연결합니다. 
현재 마스터 계정이 박과장 소유입니다.

1-2)
설치파일은 아래 링크 참조해주세요.
파일명 : LXH_PROJECT.zip / lxh_cms.dmp

https://drive.google.com/drive/folders/1VVjYyOTYxL2_UBL1YD46ez3vG3QM9fA8?usp=sharing

2. 깃허브
현재 두개의 레파지토리 운영중입니다.
lxh2023 - 해당 영역이 박과장과 제가 커밋하고 있는 파트고요.
 L main 브런치
   : 이효진 퍼블 작업하면서 사용중입니다.

 L origin/report_swpark 브런치
  : 박과장님만 사용중입니다. 
  : 중복파일 방지용으로 백엔드, 프론트 작업으로 사용하고, 필요서 main에 커밋해주는 식으로 사용중입니다.
lxh2023_design - 윤지호(퍼블리셔) 작업용으로 만들어놨는 부분입니다.

3. 설치
3-1) 이클립스
3-2) 오라클
[오라클 로컬 설치]
- 다운로드 - https://www.oracle.com/database/technologies/xe-prior-release-downloads.html
- 설치 후 스키마/유저(LXH_CMS) 생성
- Import : imp userid=system/manager owner=LXH_CMS file='D:\dev\lxh_cms.dmp' 
3-3) 소스적용
3-3-1) C:\projects 폴더생성
3-3-2) LXH_PROJECT 폴더 복사 (다운로드 파일)
3-3-3) jdk-8u361-windows-x64.exe 설치하여 사용중입니다.
3-3-4) 자바, 오라클 환경변수 추가 
3-3-5) 메이븐 설정
3-3-6) 깃랩 폴더 동기화



4. 참고사항
편의성을 고려하여 현재 프로젝트 폴더 위치는 동일하게 설정했습니다.
C:\projects\LXH_PROJECT\framework\workspace\hd_const\

퍼블리싱 작업본 
C:\projects\LXH_PROJECT\framework\workspace\hd_const\src\main\webapp\_html2023

퍼블리싱 페이지 (html)
C:\projects\LXH_PROJECT\framework\workspace\hd_const\src\main\webapp\WEB-INF\jsp

CMS 게시판 소스(공지사항)
http://localhost/article/list.do?menuKey=59&boardKey=5
(경로(폴더) : \hd_const\src\main\webapp\WEB-INF\jsp\article\def
상기 페이지의 리스트/뷰/작성화면의 디자인 개선

참고) 게시판 *.do controller 정의
hd_const\src\main\java\kr\freedi\dev\article\controller\ArticleController.java

db_con)
\hd_const\src\main\resources\kr\freedi\dev\spring\context-datasource.xml

각 페이지 매핑 (.do)
hd_const/src/main/java/kr/freedi/dev/app/controller/AppControoler.java에서 등록 및 적용 (퍼블리싱 페이지 띄우기 위함)


<과제등록 기준에 따른 구조 설명>
[페이지 - 컨트롤러 - 데이터 형 일치]
[컨트롤러-도메인-서비스]
http://localhost/report/insertForm.do?menuKey=29&repCode=18
Source : hd_const/src/main/webapp/WEB-INF/jsp/app/report/InsertForm.jsp

hd_const/src/main/java/kr/freedi/dev/qreport/controller/ReportController.java
JSTL 코드

hd_const/src/main/java/kr/freedi/dev/qreport/domain/ReportVO.java

hd_const/src/main/resources/kr/freedi/dev/sqlmap/default/Report.xml
디비 컬럼을 기준으로 작성

