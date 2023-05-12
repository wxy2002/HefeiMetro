library(ggplot2)
library(RColorBrewer)
library(export)
library(showtext)

showtext_auto()
font_add("yahei", "微软雅黑.ttf")

station <- read.csv('station.csv', header = TRUE, sep = ",",
                    encoding = 'UTF-8')
path <- read.csv('path.csv', header = TRUE, sep = ",",
                 encoding = 'UTF-8')
station$line <- as.character(station$line)
x <- paste(1:7, '号线', sep = ' ')
station$line <- factor(x = station$line, labels = x)

# p <- brewer.pal(7, 'Set1')
ggplot(data = station) + 
  geom_path(aes(x = lng, y = lat, color = line), size = 1.5,
            linejoin = "bevel", lineend = "square") + 
  geom_point(aes(x = lng, y = lat, color = line, group = line), 
             fill = 'white', size = 3.5, shape = 21) +
  labs(color="地铁线路") + 
  scale_x_continuous("经度") +
  scale_y_continuous("纬度") + 
  theme(text = element_text(family = 'yahei'))
  # theme(legend.title=element_text(colour = "Line"))
# graph2svg()
ggsave('1.svg', width = 8, height = 8)