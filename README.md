# IMBio — Instituto de Manejo da Biodiversidade

Scripts em R usados em trabalhos para o **Instituto de Manejo da Biodiversidade (IMBio)**.
**Lucas Aøsf** · Pesquisa & Soluções Ambientais

## `Parque das Nascentes Análises.R`

Gráficos preparados para o banner da COP30 sobre o Parque das Nascentes:

- **Temperatura (2019–2024):** área reflorestada do parque × entorno não reflorestado.
- **Riqueza de aves (2019–2024):** riqueza acumulada por ano e número de espécies novas registradas a cada ano.

Os gráficos são salvos em alta resolução (300 dpi) com `ggsave()`.

**Pacotes:** `ggplot2`, `dplyr`, `readr`

## Como usar

1. Abra o script no **RStudio** e instale os pacotes, se necessário.
2. Ajuste os dados (definidos no próprio script) e o caminho de saída em `caminho_salvar`.
3. Rode cada bloco para gerar e salvar o gráfico.
