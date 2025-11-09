# --- SCRIPT PARA GERAR O GRÁFICO DO BANNER COP30 ---
# Lucas Aosf
# Thu Nov  3 22:42:31 2025 ------------------------------

# 1. Instalar Pacotes
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("readr")) install.packages("readr")

# 2. Carregar Pacotes
library(ggplot2)
library(readr)

# 3. Definir Dados 
dados_csv <- "
Ano,Area,Temperatura_C
2019,Parque (Reflorestado),36.5
2020,Parque (Reflorestado),35.0
2021,Parque (Reflorestado),33.0
2022,Parque (Reflorestado),31.0
2023,Parque (Reflorestado),30.0
2024,Parque (Reflorestado),29.5
2019,Entorno (Não Reflorestado),37.0
2020,Entorno (Não Reflorestado),37.2
2021,Entorno (Não Reflorestado),37.5
2022,Entorno (Não Reflorestado),37.8
2023,Entorno (Não Reflorestado),38.0
2024,Entorno (Não Reflorestado),38.5
"

# 4. Ler os Dados
dados <- read_csv(dados_csv, show_col_types = FALSE)

# 5. Criar Gráfico
grafico_final <- ggplot(dados, aes(
  x = Ano,
  y = Temperatura_C,
  color = Area,
  group = Area,
  shape = Area
)) +
  geom_line(linewidth = 1.5) +
  geom_point(size = 3.5) +
  
  # --- Definindo Estilos ---
  scale_color_manual(values = c(
    "Parque (Reflorestado)" = "darkgreen",
    "Entorno (Não Reflorestado)" = "darkred"
  )) +
  scale_shape_manual(values = c(
    "Parque (Reflorestado)" = 16,   # círculo
    "Entorno (Não Reflorestado)" = 15  # quadrado
  )) +
  
  # --- Títulos e Legenda ---
  labs(
    title = "Tendência da Temperatura de Superfície (Verão) 2019–2024",
    subtitle = "Parque das Nascentes vs. Entorno",
    x = "Ano",
    y = "Temperatura Média de Superfície (°C)"
  ) +
  
  theme_gray(base_size = 14) +
  theme(
    legend.position = "bottom",      # legenda na parte inferior
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    legend.title = element_blank()
  ) +
  scale_x_continuous(breaks = 2019:2024) +
  ylim(28, 39)

# 6. Plotar o Gráfico
print(grafico_final)

# 7. SALVAR O GRÁFICO EM ALTA RESOLUÇÃO NA PASTA ESPECIFICADA
caminho_salvar <- "C:/Users/Lucas Aosf/Desktop/COP30/grafico_banner_cop30_FINAL.png"

ggsave(
  filename = caminho_salvar,
  plot = grafico_final,
  width = 11,
  height = 7,
  dpi = 300
)

# 8. MENSAGEM DE SUCESSO
message("✅ Gráfico salvo com sucesso em: ", caminho_salvar)


# ----------------------- LIMPAR OS DADOS DO CONSOLE PARA GERAR O NOVO GRÁFICO -----------------------


# --- GRÁFICO: AUMENTO DA RIQUEZA DE AVES (2019–2024) ---
# Lucas Aosf
# Thu Nov  6 15:01:58 2025 ------------------------------


# 1. Carregar Pacotes 
library(ggplot2)
library(dplyr)
library(readr)

# 2. Definir Dados
dados_csv <- "
Ano,Riqueza_Aves
2019,42
2020,63
2021,85
2022,95
2023,108
2024,119
"

dados <- read_csv(dados_csv, show_col_types = FALSE)

# 3. CALCULAR NOVAS ESPÉCIES POR ANO
dados <- dados %>%
  arrange(Ano) %>%
  mutate(Novas_Especies = Riqueza_Aves - lag(Riqueza_Aves, default = first(Riqueza_Aves)))

dados$Novas_Especies[1] <- dados$Riqueza_Aves[1]

# 4. GRÁFICO
grafico_riqueza_com_barras <- ggplot(dados, aes(x = Ano)) +
  
  # Barras: novas espécies
  geom_col(aes(y = Novas_Especies, fill = "Novas espécies registradas por ano"),
           alpha = 0.7,
           width = 0.6) +
  
  # Linha: riqueza total
  geom_line(aes(y = Riqueza_Aves, color = "Riqueza total de espécies"),
            linewidth = 1.8) +
  
  geom_point(aes(y = Riqueza_Aves, color = "Riqueza total de espécies"),
             size = 4) +
  
  # Rótulos de valores
  geom_text(aes(y = Riqueza_Aves, label = Riqueza_Aves),
            vjust = -1,
            size = 4.2,
            color = "black") +
  
  geom_text(aes(y = Novas_Especies, label = Novas_Especies),
            vjust = 1.5,
            size = 3.8,
            color = "black") +
  
  # Escalas
  scale_x_continuous(breaks = 2019:2024) +
  scale_y_continuous(breaks = c(0, 25, 50, 75, 100, 125), limits = c(0, 140)) +
  
  # Cores
  scale_fill_manual(name = NULL, values = c("Novas espécies registradas por ano" = "lightgreen")) +
  scale_color_manual(name = NULL, values = c("Riqueza total de espécies" = "darkgreen")) +
  
  # Títulos e eixos
  labs(
    title = "Aumento da Riqueza de Espécies de Aves (2019–2024)",
    subtitle = "Área Reflorestada — Parque das Nascentes",
    x = "Ano",
    y = "Número de Espécies de Aves"
  ) +
  
  # Tema visual
  theme_gray(base_size = 14) +
  theme(
    legend.position = "bottom",
    legend.box = "horizontal",
    legend.text = element_text(size = 12),
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    axis.title.y = element_text(face = "bold")
  )

# 5. Plotar
print(grafico_riqueza_com_barras)

# 6. SALVAR EM ALTA RESOLUÇÃO
caminho_salvar <- "C:/Users/Lucas Aosf/Desktop/COP30/grafico_riqueza_aves_COM_LEGENDA.png"

ggsave(
  filename = caminho_salvar,
  plot = grafico_riqueza_com_barras,
  width = 10,
  height = 6,
  dpi = 300
)

message("✅ Gráfico salvo com sucesso em: ", caminho_salvar)

# FIM