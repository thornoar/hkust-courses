# png("analysis.png")
png("analysis.png")

# free_mass_holder_mass <- 3.78e-3
# free_mass <- 29.98e-3
# fixed_mass <- 30.05e-3
# R <- 8e-2
#
# run1 <- read.csv("./run_1.csv")
# run2 <- read.csv("./run_2.csv")
# run3 <- read.csv("./run_3.csv")
#
# plot(
#     log(run1$F) ~ log(run1$omega),
#     xlim = c(2.8,4.0),
#     ylim = c(0.0,2.0),
#     xlab = "Logarithm of angular velocity (ln (rad/s))",
#     ylab = "Logarithm of centripetal force (ln N)"
# )
# # lines(log(run2$F) ~ log(run2$omega), col = "green")
# # lines(log(run3$F) ~ log(run3$omega), col = "blue")
#
# m <- lm(log(run1$F) ~ log(run1$omega))
#
# summary(m)
#
# coef(m)[1]
# coef(m)[2]
#
# abline(a = coef(m)[1], b = coef(m)[2], col = "blue")

rad <- c(0.06,0.07,0.08,0.09,0.1)
mu <- c(2.54,2.91,3.29,3.80,4.15)
stdd <- c(0.05,0.10,0.10,0.19,0.19)

plot(mu ~ rad, type = "l", xlab = "Radius (m)", ylab = "Force (N)", col = "red")
arrows(x0 = rad, y0 = mu-stdd, x1 = rad, y1 = mu+stdd, code = 3, angle = 90, length = 0.1)

m <- lm(mu ~ rad)

coef(m)[1]
coef(m)[2]

abline(a = coef(m)[1], b = coef(m)[2], col = "blue")
