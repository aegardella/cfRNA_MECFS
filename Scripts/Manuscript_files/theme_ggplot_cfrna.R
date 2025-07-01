theme_cfrna_paper <- function() {
  theme_bw() +
    theme(
      panel.background = element_rect(fill = "white"), 
      panel.border = element_rect(color = 'black', fill = NA, linewidth = 0.35),  
      plot.margin = margin(0.5, 0.5, 0.5, 0.5),
      title = element_text(size = 8, color = 'black'), 
      axis.title = element_text(size = 8, color = 'black'),
      axis.ticks = element_line(color = 'black', linewidth = 0.2),
      axis.ticks.length = unit(0.05, "cm"),        
      axis.text = element_text(size = 6, color = 'black'),
      strip.text = element_text(size=8, color='black'),
      legend.position = "none",
      legend.text = element_text(size = 6),
      legend.title = element_text(size = 7),
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank()
    )
}

COLORS <- c("MECFS" = "#023E8A", "HC" = "#a31621", "1" = "#023E8A", "0" = "#a31621")
COLORS_FILL <- c("MECFS" = "#D7E8FE", "HC" = "#FADBDE", "1" = "#D7E8FE", "0" = "#FADBDE")