if (!require(gtools)) {
  install.packages("gtools")
}
if (!require(prob)) {
  install.packages("prob", repos="http://R-Forge.R-project.org")
}
require(gtools)
require(prob)

# tạo dãy phần tử
elements <- c("A", "C", "G", "U")
# Số lượng phần tử trong mỗi tổ hợp
n <- 3
# Tổng số lượng phần tử
N <- length(elements)

# Xài gtools ===========================================================================================

# Số codon có thể có là:
# Sinh tất cả codon có thể có (có thứ tự, có lặp lại)
ordered_combinations <- permutations(n = length(elements), r = n, v = elements, repeats.allowed = TRUE)
print(ordered_combinations)
# Lực lượng: 
cardinality_ordered_combinations <- N^n
print(cardinality_ordered_combinations)



# Sinh tất cả codon có 3 nucleotic khác nhau (có thứ tự, KHÔNG lặp lại)
ordered_distinct_combinations <- permutations(n = length(elements), r = n, v = elements, repeats.allowed = FALSE)
print(ordered_distinct_combinations)
cardinality_ordered_distinct_combinations <- factorial(N)/factorial(N-n)
print(cardinality_ordered_distinct_combinations)


# Sinh tất cả codon có 3 nucleotic khác nhau không phân biệt thứ tự
unordered_distinct_combinations <- combinations(n = length(elements), r = n, v = elements, repeats.allowed = FALSE)
print(unordered_distinct_combinations)
cardinality_unordered_distinct_combinations <- factorial(N)/(factorial(N-n)*factorial(n))
print(cardinality_unordered_distinct_combinations)



# Sinh tất cả codon có thể lặp lại và không phân biệt thứ tự
unordered_combinations <- combinations(n = length(elements), r = n, v = elements, repeats.allowed = TRUE)
print(unordered_combinations)
cardinality_unordered_combinations <- factorial(N-1+n)/(factorial(N-1)*factorial(n))
print(cardinality_unordered_combinations)





# Xài prob ===========================================================================================
ordered_combinations <- urnsamples(x=elements, size=n, replace=TRUE, ordered=TRUE)
print(ordered_combinations)

# Sinh tất cả codon có 3 nucleotic khác nhau (có thứ tự, KHÔNG lặp lại)
ordered_distinct_combinations <- urnsamples(x=elements, size=n, replace=FALSE, ordered=TRUE)
print(ordered_distinct_combinations)

# Sinh tất cả codon có 3 nucleotic khác nhau không phân biệt thứ tự
unordered_distinct_combinations <- urnsamples(x=elements, size=n, replace=FALSE, ordered=FALSE)
print(unordered_distinct_combinations)

# Sinh tất cả codon có thể lặp lại và không phân biệt thứ tự
unordered_combinations <- urnsamples(x=elements, size=n, replace=TRUE, ordered=FALSE)
print(unordered_combinations)





# Bài 2.2

# Hộp có 3 banh đỏ, 2 banh trắng
Box <- c(rep('red', 3), rep('white',5))

print(Box)
Omega <- urnsamples(Box,2, replace = FALSE, ordered = FALSE)
print(Omega)
KGXS <- probspace(Omega)
print(KGXS)
eprint(KGXS)
A <- subset(KGXS, X1=='red'.  & X2=='red')
print(A)
B <- subset(KGXS, X1=='white' & X2=='white')
print(B)
C <- subset(KGXS, X1=='red'   & X2=='white')
print(C)
Prob(A)
Prob(B)
Prob(C)
sum(A$probs)
sum(B$probs)
sum(C$probs)
