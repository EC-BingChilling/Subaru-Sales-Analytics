# Load necessary packages
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
if (!require(readr)) install.packages("readr", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

library(ggplot2)
library(readr)
library(dplyr)

# Load the U.S. YTD sales data
data <- read_csv("data/processed/usa-subaru-sales-2024.csv")

# Drop TOTAL row (optional but recommended for model-only comparison)
data <- filter(data, model != "TOTAL")

# Reorder by YTD 2024 sales
data <- data %>%
  mutate(model = reorder(model, ytd_2024))

# Plot
plot <- ggplot(data, aes(x = ytd_2024, y = model)) +
  geom_col(fill = "#70AD47") +
  labs(
    title = "Subaru U.S. Sales by Model (Full Year 2024)",
    x = "YTD Sales (units)",
    y = "Model"
  ) +
  theme_minimal()

# Show in viewer
print(plot)

# Save chart
ggsave("outputs/usa_sales_bar_chart.png", plot, width = 10, height = 6)
