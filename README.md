# Regression Analysis
2022.09 - 2022.12  

**통계이론연구실 (PI: Ilsang Ohn)**

본 저장소는 2022년 9월부터 12월까지 인하대학교 이론통계연구실에서 학부연구생으로 활동하며 수행한 회귀분석 관련 시뮬레이션 및 분석 코드를 정리한 공간입니다.  
R 언어를 활용하여 회귀계수 추정의 분산, 잭나이프(Jackknife) 추정, 오차 분포의 영향, 예측/신뢰 구간 비교, 모형 진단 등 다양한 통계 개념을 직접 구현하고 시각화한 실험 코드들로 구성되어 있습니다.

해당 기간 동안 아래와 같은 활동을 수행하였습니다:

- 선형대수학의 핵심 개념 정리 및 회귀분석과의 연결 고찰
- 회귀모형의 기본 가정에 대한 R 시뮬레이션 설계 및 분석
- 회귀모형에서 정규성 가정을 다루는 방법론에 대한 논문 리뷰  
  (*How to Address Non-normality: A Taxonomy of Approaches, Reviewed, and Illustrated*)


---

### 📁 파일 설명
| 파일 이름 | 설명 |
|-----------|------|
| `beta0_estimation_with_high_variance.R` | X의 분산이 큰 경우 절편(beta0) 추정치의 변동성 확인 시뮬레이션 |
| `beta1_estimation_with_high_variance.R` | X의 분산이 큰 경우 기울기(beta1) 추정치의 변동성 확인 시뮬레이션 |
| `beta_est_with_t2_noise.R` | 오차항이 자유도 2인 t분포를 따를 때의 회귀계수 추정 시뮬레이션 |
| `beta_est_with_t3_noise.R` | 오차항이 자유도 3인 t분포를 따를 때의 회귀계수 추정 시뮬레이션 |
| `beta_est_with_unif_noise.R` | 오차항이 균등분포를 따를 때의 회귀계수 추정 시뮬레이션 |
| `ci_vs_pi_simulation.R` | 신뢰구간(CI)과 예측구간(PI)의 차이를 시각적으로 비교하는 시뮬레이션 |
| `hatvalues.R` | 모형 진단을 위한 hat matrix의 대각 원소 시각화 및 이상치 탐지 실험 |
| `heteroskedasticity_simulation.R` | 분산이 일정하지 않은 (이분산성) 상황에서 잔차의 분포를 분석 |
| `jackknife.R` | 잭나이프(Jackknife) 방법을 활용한 회귀계수 추정의 분산 추정 시뮬레이션 |

---

### ▶️ 실행 방법

1. [R](https://cran.r-project.org/) 또는 [RStudio](https://posit.co/download/rstudio-desktop/) 설치
2. 필요한 패키지 설치:
    ```r
    install.packages(c("ggplot2", "dplyr"))
    ```
3. 원하는 `.R` 파일을 열고 전체 실행 또는 필요한 부분만 실행

---

### 📚 참고 문헌

- Chatterjee, S., & Hadi, A. S. (2012). *Regression Analysis by Example* (5th ed.). Wiley.
- R 공식 문서 및 통계 패키지 문서들
- Lumley, T. et al. (2022). *How to Address Non-normality: A Taxonomy of Approaches, Reviewed, and Illustrated*. Communications in Statistics.


