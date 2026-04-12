# Signal Processing Concepts

## 📖 Overview
This repository documents advanced signal processing techniques frequently used in research pipelines. Each section provides:
- **Definition**
- **Mathematical formulation**
- **Applications**
- **IEEE-style citation**

---

## 1. Hampel Filter
**Definition**: A robust outlier detection filter based on the median and Median Absolute Deviation (MAD).  
**Mathematics**:


\[
MAD = \text{median}(|x_i - m|)
\]




\[
|x_c - m| > k \cdot MAD \quad \Rightarrow \quad x_c \text{ replaced}
\]

  
**Applications**: Removes impulsive noise while preserving signal structure.  
**Citation**: R. K. Pearson et al., *“Generalized Hampel Filters,”* EURASIP J. Adv. Signal Process., 2016.

---

## 2. SpotFi
**Definition**: WiFi-based indoor localization using Angle of Arrival (AoA) and Time of Arrival (ToA).  
**Mathematics**:


\[
P(\theta) = \frac{1}{a^H(\theta) E E^H a(\theta)}
\]

  
**Applications**: Decimeter-level localization with commodity WiFi.  
**Citation**: M. Kotaru et al., *“SpotFi: Decimeter Level Localization Using WiFi,”* ACM SIGCOMM, 2015.

---

## 3. Fresnel Zones
**Definition**: Ellipsoidal regions between transmitter and receiver determining constructive/destructive interference.  
**Mathematics**:


\[
r_n = \sqrt{\frac{n \lambda d_1 d_2}{d_1 + d_2}}
\]

  
**Applications**: Wireless communication, motion detection, channel modeling.  
**Citation**