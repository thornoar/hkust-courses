# Part I

L <- 0.60
m <- 0.246
g <- 9.81
angles <- c(pi / 12, pi / 6, pi / 4)
m_u <- c(0.0686, 0.1300, 0.1819)
F_u <- m_u * g
m_d <- c(0.0619, 0.1200, 0.1720)
F_d <- m_d * g
h <- L * sin(angles)
f_k <- 0.5 * (F_u - F_d)
F_u.L = F_u * L
f_k.L = f_k * L
dGPE <- m * g * h
pe <- abs(F_u.L - (f_k.L + dGPE))/((F_u.L + f_k.L + dGPE)/2) * 100

part_1 <- data.frame(
    angles = angles,
    m_up = m_u,
    F_up = F_u,
    m_down = m_d,
    F_down = F_d,
    h = h,
    f_k = f_k,
    F_u.L = F_u.L,
    f_k.L = f_k.L,
    dGPE = dGPE,
    f_k.L_plus_dGPE = f_k.L+dGPE,
    percent_error = pe
)
# part_1
write.csv(part_1, "./part_1.csv")

# Part II

sl_f_m <- 0.0520
sl_f_k <- sl_f_m * g
sl_mu <- sl_f_k / (m * g)

st_f_m <- 0.0530
st_f_k <- st_f_m * g
st_mu <- st_f_k / (m * g)

angles <- c(2.5, 12, 13) * pi / 180
mus <- tan(angles)

mus
