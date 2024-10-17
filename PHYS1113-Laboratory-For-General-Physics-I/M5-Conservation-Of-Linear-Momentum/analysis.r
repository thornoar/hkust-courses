m1_in <- 0.198
m2_in <- 0.198

v1_in_b <- c(-0.21, -0.365)
n1_in_b <- c(51,30)
sd1_in_b <- c(0.005, 0.006)
ste1_in_b <- sd1_in_b/sqrt(n1_in_b)
v2_in_b <- c(0.30, 0.34)
n2_in_b <- c(40,32)
sd2_in_b <- c(0.003, 0.006)
ste2_in_b <- sd2_in_b/sqrt(n2_in_b)
p_in_b <- m1_in * v1_in_b + m2_in * v2_in_b

v1_in_a <- c(0.05, 0.0047)
n1_in_a <- c(52,29)
sd1_in_a <- c(0.007, 0.0055)
ste1_in_a <- sd1_in_a/sqrt(n1_in_a)
v2_in_a <- c(0.048, 0.0056)
n2_in_a <- c(40,32)
sd2_in_a <- c(0.008, 0.0037)
ste2_in_a <- sd2_in_a/sqrt(n2_in_a)
p_in_a <- m1_in * v1_in_a + m2_in * v2_in_a

m1_el <- 0.198
m2_el <- 0.199

v1_el_b <- c(-0.355, -0.385)
n1_el_b <- c(19,30)
sd1_el_b <- c(0.008, 0.008)
ste1_el_b <- sd1_el_b/sqrt(n1_el_b)
v2_el_b <- c(0.583, 0.125)
n2_el_b <- c(25,41)
sd2_el_b <- c(0.006, 0.003)
ste2_el_b <- sd2_el_b/sqrt(n2_el_b)
p_el_b <- m1_el * v1_el_b + m2_el * v2_el_b

v1_el_a <- c(0.478, 0.116)
n1_el_a <- c(15,19)
sd1_el_a <- c(0.009, 0.007)
ste1_el_a <- sd1_el_a/sqrt(n1_el_a)
v2_el_a <- c(-0.295, -0.344)
n2_el_a <- c(26,20)
sd2_el_a <- c(0.004, 0.006)
ste2_el_a <- sd2_el_a/sqrt(n2_el_a)
p_el_a <- m1_el * v1_el_a + m2_el * v2_el_a

abs(p_el_a - p_el_b)/abs(p_el_b)*100
