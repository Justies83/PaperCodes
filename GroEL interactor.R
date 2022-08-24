library(tidyverse)
library(haven)
library(ggplot2)
library(ggtext)
library(RColorBrewer)
library(grid)
library(gridExtra)
library(readxl)
library(reshape2)
library(plyr)
library(patchwork)
library(cowplot)
library(ggpubr)
library(ggh4x)
library(ggbreak)

setwd("C:/For publish/")
metadata <- read_excel("GroEL interactor.xlsx", na="NA") 
metadata$acidity = ifelse(metadata$pI < 7.5, 0, 1)
metadata$group = ifelse(metadata$p < 0.05, "Sig", "NS")
library(ggplot2)
a<-
  ggplot(metadata) +
  aes(x = pI, y = kDa, colour = group) +
  geom_point(shape = "circle", size = 10) +
  scale_color_manual(values = c(Sig = "Red", NS = "Blue")) +
  theme_minimal()+
  theme(axis.line = element_line(arrow = arrow(length = unit(0.2, "cm"))),
        legend.position="none",
        axis.title = element_blank(),
        axis.text = element_blank())
ggsave("Figure_4B_pI_kDa_GroELinteractor_significance_two.tiff",plot = a, dev="tiff", dpi=600, height=30, width=40, units="cm")


b <-
  ggplot(metadata) +
  aes(x = pI, y = kDa, colour = Sig) +
  geom_point(shape = "circle", size = 9) +
  scale_color_manual(values = c(Sig = "Red", NS = "Blue", only = "Black")) +
  theme_minimal()+
  theme(axis.line = element_line(arrow = arrow(length = unit(0.2, "cm"))),
        legend.position="none",
        axis.title = element_blank(),
        axis.text = element_blank())
ggsave("Figure_4B_pI_kDa_GroELinteractor_significance_three.tiff",plot = b, dev="tiff", dpi=600, height=30, width=40, units="cm")
