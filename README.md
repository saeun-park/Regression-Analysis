# Regression Analysis

이 저장소는 이론통계연구실 학부연구생으로서 수행한 회귀분석 관련 시뮬레이션 및 분석 코드들을 정리한 곳이다.
R 언어를 활용하여 회귀계수 추정의 분산, 잭나이프(Jackknife) 추정, 오차 분포의 영향, 예측/신뢰 구간 비교, 모형 진단 등 다양한 통계 개념을 직접 구현하고 시각화한 실험 코드들로 구성되어 있다.

---

## 📁 파일 설명
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

