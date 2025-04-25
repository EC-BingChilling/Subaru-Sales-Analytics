# Load required packages
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

library(ggplot2)
library(dplyr)

# Load the global sales CSV
data <- read.csv("data/processed/subaru-global-sales-2024.csv")

# Reorder bars by value
data <- data %>%
  mutate(model = reorder(model, sales_2024_thousands))

# Create bar plot
plot <- ggplot(data, aes(x = sales_2024_thousands, y = model)) +
  geom_col(fill = "#4472C4") +
  labs(
    title = "Subaru Global Sales by Model (FY 2024)",
    x = "Sales (in thousands)",
    y = "Model"
  ) +
  theme_minimal()

# Show plot in RStudio viewer
print(plot)

# Save as PNG
ggsave("outputs/global_sales_bar_chart.png", plot, width = 10, height = 6)
