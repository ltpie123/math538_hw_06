# Plot Discussion

## Logistic Map

### Lyapunov Exponent (λ)

  - $f(x) = ax(1-x)$
  - The Lyapunov exponent measures the sensitivity of a dynamic system to the initial conditions.
  - λ > 0 indicates chaotic behavior
  - λ < 0 indicates stability (trajectories converge to a fixed point)
  - λ = 0 is a bifurcation point (fixed point becomes unstable and splits into a two cycle)

  - 2 < a < 3 --> λ < 0 and approaches 0
  - a ≈ 3 --> λ approaches 0 and is the first bifurcation point
  - 3 < a < ~3.45 λ < 0 and approaches 0, second bifurcation point
  - a ≈ 3.6 --> λ approaches 0 and is the third bifurcation point before instability ensues

  - instability increases overtime but still has some stable points, as seen by the pockets of white in the bifurcation diagram or the points to the right of 3.5 and below 0 on the first figure.

### Bifurcation Diagram

  - shows long-term behavior of the logistic map as controlled by a.
  - lines made up of points of given a vals
  - when the graph splits it is a bifurcation point and indicates the system is settling into a stable limit cycle (e.g. 2 to 4 values)
  - filled regions (chaotic behavior) and experiences continuous range of x
  - the gaps in the bifurcation diagram are windows of order or periodic windows
  - map gives us the opportunity to escape/blow-up (go to infinity)

  - as a arrives at 4, the system is sent into full chaos.

## Cubic Map

### Lyapunov Exponent (λ)

  - f(x) = ax^3 + (1-a)x
  - starts at 0 not negative infinity
  - shows first bifurcation point at a = 2
  - demonstrates stability when a < 3.26 and approaches full chaos as it passes 3.26
  - this is different from the logistic map
  - chaos ensues faster in the cubic map

### Bifurcation Diagram

  - shows a bifurcation at the origin with a = 2
  - a peculiar split at 3, where only the bottom half of each split is populated
  - another bifurcation at 3.25
  - full chaos appears to ensue at 3.35
  - demonstrates periodic windows at around 3.45, 3.7, and 3.8
  - seems to have the same shape of the logistic map after the first bifurcation point
