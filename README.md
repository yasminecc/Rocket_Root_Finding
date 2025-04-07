# Root Finding Methods in MATLAB – Rocket Velocity and Derivative Accuracy

This project contains two exercises implemented in MATLAB, each focusing on different aspects of numerical methods:

---

## Exercise 1: Central Difference Derivative Approximation

- Estimates the derivative of `f(x) = x * exp(x)` at `x = 3` using the **central finite difference method**.
- Calculates and plots:
  - Relative absolute **true error** compared to the exact derivative.
  - Relative absolute **approximate error** using consecutive approximations.
- Outputs:
  - A **log-log plot** of both errors vs step size.
  - The **step size with the least true error** is printed.

---

## Exercise 2: Root Finding for Saturn V Rocket Velocity

- Solves for the time `t` when the rocket reaches a velocity of `v = 335 m/s`.
- Uses three root-finding methods:
  - **Bisection Method**
  - **Newton-Raphson Method**
  - **Secant Method**
- The function solved:
  ```
  v(t) = u * log(M0 / (M0 - m_dot * t)) - g * t - v
  ```
- Each method prints:
  - Initial guesses
  - Final result
  - Number of iterations
  - Final error

---

## How to Run

Open MATLAB and run each script:

```matlab
Exercise1
Exercise2
```

Make sure the files are in the same folder.

---

## Author

**Yasmine Elsisi**  

