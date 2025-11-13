# RustDesk Support Client Auto Builder

## 사용 방법

1. 이 ZIP을 그대로 GitHub 새 레포지토리에 업로드합니다.
2. `.github/workflows/build.yml` 위치가 그대로 유지되어야 합니다.
3. GitHub → Actions → Build RustDesk Support Client 실행
4. 빌드가 완료되면 Artifacts에서 `고객지원도우미` 다운로드

이 빌드는 자동으로 RustDesk 소스를 가져오고,
서버 주소 / Relay / Public Key를 적용하여
완성된 실행 파일을 제공합니다.
