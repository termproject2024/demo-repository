# ♻ 대형 폐기물 분류 및 인공지능 활용 프로젝트

**목적**: 대형 폐기물(침대, 서랍장, 소파 등)의 자동 인식 및 분류 시스템 구축<br>

**중점**: 객체 검출(Segmentation) 및 분류 모델 적용<br>
- YOLO 및 Faster R-CNN을 활용한 AI 기반 폐기물 인식<br>

- AWS 연동을 통한 모델 배포 및 실시간 탐지<br>

- 최적의 데이터셋 구축 및 전처리 (크롤링 & 수집)<br>

# 📌 주요 기능
**1. AI 기반 대형 폐기물 탐지**
- 거리 또는 특정 장소에서 침대, 소파, 서랍장 등 폐기물 분류
- YOLO/Faster R-CNN 모델을 활용하여 객체 인식
  
**2. AWS 클라우드 배포**
- AWS Lambda + API Gateway를 통해 실시간 탐지 API 구축
- Amazon S3를 활용한 대량 이미지 저장 및 관리
  
**3. 데이터셋 구축 및 자동 크롤링**
- Google/SNS 등에서 대형 폐기물 이미지 크롤링
- OpenCV 활용 데이터 전처리 및 증강(Augmentation)
  
**4. 웹/모바일 연동 가능**
- 탐지된 폐기물 정보를 모바일 앱 및 웹 플랫폼과 연동
  
# 📂 데이터 수집 및 전처리
✔ AI Hub, Kaggle, Google Images에서 폐기물 이미지 확보  
✔ Selenium을 이용한 크롤링 자동화  
✔ 데이터 증강(Augmentation) 및 정제 후 모델 학습  

# 🚀 YOLO & Faster R-CNN 모델 적용  
- YOLOv8: 실시간 객체 검출, 속도 최적화  
- Faster R-CNN: 정확도 높은 분류 수행  
- 전이학습(Transfer Learning) 적용: 기존 학습된 모델을 활용하여 폐기물 탐지 성능 향상  
# 🌐 AWS 배포 및 서비스 연동
서비스	역할
AWS Lambda	AI 모델 서버리스 배포
AWS S3	대형 이미지 저장소
AWS API Gateway	클라이언트와 AI 모델 연동
AWS EC2	모델 학습 서버 구축
# 📌 현재 진행 상황  
✅ 데이터 수집 및 크롤링 (완료)  
✅ YOLO & Faster R-CNN 모델 구축 (완료)  
🔄 AWS 연동 진행 중 (진행 중)  
⏳ 실시간 API 개발 및 배포 (다음 단계) 

# 📜 프로젝트 설명
**기존 지적사항 보완**

결제 시스템 제거 → 프로젝트 핵심 기능에 집중 (Segmentation & AWS 연동)  
YOLO & Faster R-CNN을 AWS에서 연동하여 실시간 분석 가능  
# 기대 효과
✔ 대형 폐기물 관리 자동화  
✔ AI 기반 실시간 탐지 시스템 구축  
✔ 환경 문제 해결 및 폐기물 재활용 활성화  

# 📎 참고자료
AI Hub: https://www.aihub.or.kr/  
Kaggle: https://www.kaggle.com/  
AWS Docs: https://aws.amazon.com/ko/documentation/  
# 👥 팀 소개
**팀장 :  임도영**  
**팀원 : 김민규 / 임준영 / 정성아**  

🚀 AI 기반 혁신적인 솔루션 개발을 목표로 하는 팀입니다.<br>
💡 폐기물 분류 및 처리 시스템의 효율성 증대를 위해 연구 중<br>
📩 문의: your_email@example.com<br>
📌 GitHub: https://github.com/your_project<br>
