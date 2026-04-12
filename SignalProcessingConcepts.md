# Signal Processing Concepts

## 📖 Overview
This repository documents advanced signal processing techniques frequently used in research pipelines. Each section provides:
- **Definition**
- **Mathematical formulation (plain text + rendered SVG)**
- **Applications**
- **IEEE-style citation**

---

## 1. Hampel Filter
**Definition**: A robust outlier detection filter based on the median and Median Absolute Deviation (MAD).  

**Mathematics (plain text)**  
MAD = median(|xᵢ − m|)  
Condition: |x_c − m| > k * MAD → replace x_c  

**Mathematics (rendered)**  
![Equation](https://latex.codecogs.com/svg.latex?MAD%20=%20\text{median}(|x_i%20-%20m|))  
![Equation](https://latex.codecogs.com/svg.latex?|x_c%20-%20m|%20>%20k%20\cdot%20MAD%20\Rightarrow%20x_c%20\text{replaced})  

**Applications**: Removes impulsive noise while preserving signal structure.  
**Citation**: R. K. Pearson et al., *“Generalized Hampel Filters,”* EURASIP J. Adv. Signal Process., 2016.

---

## 2. SpotFi
**Definition**: WiFi-based indoor localization using Angle of Arrival (AoA) and Time of Arrival (ToA).  

**Mathematics (plain text)**  
P(θ) = 1 / [aᴴ(θ) E Eᴴ a(θ)]  

**Mathematics (rendered)**  
![Equation](https://latex.codecogs.com/svg.latex?P(\theta)%20=%20\frac{1}{a^H(\theta)%20E%20E^H%20a(\theta)})  

**Applications**: Decimeter-level localization with commodity WiFi.  
**Citation**: M. Kotaru et al., *“SpotFi: Decimeter Level Localization Using WiFi,”* ACM SIGCOMM, 2015.

---

## 3. Fresnel Zones
**Definition**: Ellipsoidal regions between transmitter and receiver determining constructive/destructive interference.  

**Mathematics (plain text)**  
rₙ = sqrt( (n λ d₁ d₂) / (d₁ + d₂) )  

**Mathematics (rendered)**  
![Equation](https://latex.codecogs.com/svg.latex?r_n%20=%20\sqrt{\frac{n%20\lambda%20d_1%20d_2}{d_1%20+%20d_2}})  

**Applications**: Wireless communication, motion detection, channel modeling.  
**Citation**: H. Aoki et al., *“First-Fresnel-Zone Based Path Loss Estimation for IRS-Assisted mmWave Communications,”* IEEE VTC, 2024.

---

## 4. Blood Volume Pulse (BVP)
**Definition**: Physiological signal reflecting blood flow changes, often extracted via photoplethysmography (PPG).  

**Mathematics (plain text)**  
BVP(t) = A · e^(−αt) · sin(ωt + φ)  

**Mathematics (rendered)**  
![Equation](https://latex.codecogs.com/svg.latex?BVP(t)%20=%20A%20\cdot%20e^{-\alpha%20t}%20\sin(\omega%20t%20+%20\phi))  

**Applications**: Heart rate variability (HRV), affect recognition, wearable sensing.  
**Citation**: F. Li et al., *“Extracting Blood Volume Pulse Signal Morphology From Face Videos,”* IEEE/CVF CVPR Workshops, 2023.

---

## 5. Spectrogram
**Definition**: Time-frequency representation using Short-Time Fourier Transform (STFT).  

**Mathematics (plain text)**  
STFT: X(τ, ω) = ∫ x(t) w(t−τ) e^(−jωt) dt  
Spectrogram: S(τ, ω) = |X(τ, ω)|²  

**Mathematics (rendered)**  
![Equation](https://latex.codecogs.com/svg.latex?X(\tau,%20\omega)%20=%20\int_{-\infty}^{\infty}%20x(t)%20w(t-\tau)%20e^{-j\omega%20t}%20dt)  
![Equation](https://latex.codecogs.com/svg.latex?S(\tau,%20\omega)%20=%20|X(\tau,%20\omega)|^2)  

**Applications**: Speech recognition, biomedical signals, radar, music analysis.  
**Citation**: S. Ganapathy, *“Multivariate Autoregressive Spectrogram Modeling for Noisy Speech Recognition,”* IEEE Signal Processing Letters, 2015.

---

## 🔗 Integration in Research Pipelines
- **Hampel** → Preprocessing for robust noise removal.  
- **SpotFi** → High-resolution AoA/ToA features for localization.  
- **Fresnel** → Channel modeling features for wireless sensing.  
- **BVP** → Physiological features for HRV and affective computing.  
- **Spectrogram** → Rich time-frequency features for classification tasks.  

Together, these methods form a **modular toolkit** for advanced signal processing research, enabling reproducible pipelines and IEEE-ready documentation.
