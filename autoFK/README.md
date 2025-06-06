# Auto FK
quickly creates a simple FK controller

see [post on site](https://stuaaaaaaaaaart.github.io/posts/2024/Overthinking%20FK%20Controllers/)

controllers will always follow the result of the driven joints through the use of `offsetParentMatrix` transforms, without incurring DAG cyclic errors

# Auto MultMatrix
somewhat flexible method to quickly create and set up multMatrix nodes

made as an internalisation of understanding to how the order of matrix multiplication is handled in maya