if (!require(ggplot2)) {
  install.packages("ggplot2")
}

library(ggplot2)

# Định nghĩa hàm: R_function với biến p
R_function <- function(p) {
  p*(1-(1-p^2)*(1-p*(1-(1-p)^2)^2))
}
R_equal_p_function <- function(p) {
  p
}

# Tạo dữ liệu: tạo một chuỗi giá trị p từ 0 đến 1, bước nhảy 0.01
p_values <- seq(0, 1, 0.01)

# Tính giá trị R cho mỗi giá trị p bằng cách sử dụng hàm R_function đã định nghĩa
R_values <- R_function(p_values)
R_equal_p_values <- R_equal_p_function(p_values)

# Tạo khung dữ liệu: kết hợp tất cả vào một khung dữ liệu duy nhất
data <- data.frame(p = p_values, R = R_values, R_equal_p = R_equal_p_values)

# Vẽ hàm số
ggplot(data, aes(x=p_values)) +                  
  geom_line(aes(y=R_values), colour="red") + 
  geom_line(aes(y=R_equal_p_values), colour="blue") +
  labs(title = "Sự biến thiên độ tin cậy của hệ thống S theo p", 
       x = "Xác suất mỗi thành phần hoạt động tốt: p", 
       y = "Độ tin cậy của hệ thống: R") +
  theme_minimal()                    





# bài 2 =============
if (!require(ggplot2)) {
  install.packages("ggplot2")
}

library(ggplot2)

# Định nghĩa hàm: R_function với biến p
R_function <- function(p) {
  p*(1-(1-p)^2)+p^2*(1-p)
}
R_equal_p_function <- function(p) {
  p
}

# Tạo dữ liệu: tạo một chuỗi giá trị p từ 0 đến 1, bước nhảy 0.01
p_values <- seq(0, 1, 0.01)

# Tính giá trị R cho mỗi giá trị p bằng cách sử dụng hàm R_function đã định nghĩa
R_values <- R_function(p_values)
R_equal_p_values <- R_equal_p_function(p_values)

# Tạo khung dữ liệu: kết hợp tất cả vào một khung dữ liệu duy nhất
data <- data.frame(p = p_values, R = R_values, R_equal_p = R_equal_p_values)

# Vẽ hàm số
ggplot(data, aes(x=p_values)) +                  
  geom_line(aes(y=R_values), colour="red") + 
  geom_line(aes(y=R_equal_p_values), colour="blue") +
  labs(title = "Sự biến thiên độ tin cậy của hệ thống S theo p", 
       x = "Xác suất mỗi thành phần hoạt động tốt: p", 
       y = "Độ tin cậy của hệ thống: R") +
  theme_minimal()                    