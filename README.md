[E.S.G Dados & Recursos.md](https://github.com/user-attachments/files/34881196/E.S.G.Dados.Recursos.md)[Upload# Lista Completa de Dados, Recursos e Ferramentas — E.S.G. Mount Sharp

**Projeto:** E.S.G. Mount Sharp (*Extraterrestrial Survival Guide — Gale Crater EVA System*)  
**Região Alvo:** Encosta Inferior do Monte Sharp (*Aeolis Mons*), Cratera Gale, Marte (`5.4°S, 137.8°E`)

---

## 1. Dados Científicos e Fontes Oficiais (Domínio Público — NASA / USGS)

Todos os conjuntos de dados científicos, parâmetros planetários e referências estratigráficas utilizados no projeto pertencem ao domínio público governamental dos Estados Unidos (NASA / USGS):

1. **NASA Mars Trek (`https://trek.nasa.gov/mars/`)**
   * **Dados utilizados:** Curvas de nível topográficas baseadas nos levantamentos altimétricos **MOLA** (*Mars Orbiter Laser Altimeter* — *Mars Global Surveyor*) e **HRSC** (*Mars Express*), faixas de elevação (`-2450 m` a `-2375 m`), cálculo de declividade (*slope*) para identificação da escarpa crítica de `16.8°` e da bancada norte de abrigo (`8.5°`), valores de inércia térmica (**THEMIS**, *Thermal Emission Imaging System* — *Mars Odyssey*, variando de `135 tiu` em areia eólica solta a `345 tiu` em rocha consolidada) e bandas de absorção mineralógica (**CRISM**, *Compact Reconnaissance Imaging Spectrometer for Mars* — *MRO*, em `1.94 µm` e `2.30 µm`).
2. **USGS Astrogeology Science Center — Interactive Maps of Mars (`https://astrogeology-usgs.hub.arcgis.com/pages/interactive-maps-mars`)**
   * **Dados utilizados:** Cartografia geológica e contatos estratigráficos da Cratera Gale / Monte Sharp, delimitando a **Formação Murray** (argilitos lacustres laminados / Membro *Pahrump Hills*), a discordância do **Arenito Stimson** (*Siccar Point Unconformity*) e a **Unidade Portadora de Sulfatos** (*Sulfate-Bearing Unit* / zona *Boxwork*).
3. **Curiosity's Proposed Path Up Mount Sharp — NASA Science (`https://science.nasa.gov/resource/curiositys-proposed-path-up-mount-sharp/`)**
   * **Dados utilizados:** Trajetória histórica proposta para a subida do rover *Mars Science Laboratory (MSL) Curiosity* na encosta do Monte Sharp, transição mineralógica argila-sulfato, contexto científico das cristas poligonais **Boxwork** e valores de referência de radiação de superfície medidos pelo instrumento **MSL-RAD** (`0.24 mSv/h` de fluxo galáctico base).
4. **NASA Worldview (`https://worldview.earthdata.nasa.gov/`)**
   * **Dados utilizados:** Arquitetura de visualização em camadas múltiplas e parâmetros de profundidade óptica atmosférica por poeira (*Dust Optical Depth* — $\tau$ variando entre `0.45 τ` em céu limpo, `1.25 τ` em bruma sazonal e `2.60 τ` em tempestade regional) para restrição de visibilidade óptica e navegação.
5. **Mars 2020 Multimedia Raw Images (`https://mars.nasa.gov/mars2020/multimedia/raw-images/`)**
   * **Dados utilizados:** Referência visual e morfológica utilizada como padrão de biblioteca analógica de texturas de superfície (*Analog Surface Texture Library*) para treinamento pré-EVA e antecipação de tração e afloramentos sedimentares.

---

## 2. Modelos Matemáticos e Equações de Engenharia (Literatura Aberta)

* **Modelo Metabólico de Pandolf-Santee Adaptado à Gravidade Marciana ($g = 3.72\ \text{m/s}^2$):** Equações fisiológicas abertas (Pandolf et al., 1977; Santee et al., 2001) utilizadas para calcular o gasto energético (em Watts), o consumo de oxigênio ($\text{L/min}$) e o perímetro dinâmico de retorno seguro (*Point of No Return / Walkback Limit*) considerando massa do traje, carga de amostras geológicas, declividade do terreno e resistência superficial.
* **Algoritmo de Roteamento A\* (*A-Star Pathfinding*) e Análise DEM:** Implementação própria em JavaScript puro para cálculo trigonométrico de declive ($\theta = \arctan(\Delta z / \Delta d)$) e geração dinâmica de rotas seguras e rotas alternativas de abrigo.

---

## 3. Recursos de Código, Bibliotecas e Tipografia (Open Source / Licenças Livres)

Todo o código-fonte da aplicação foi desenvolvido originalmente em HTML5, CSS3 e JavaScript Vanilla (ES6+), utilizando apenas bibliotecas externas abertas e gratuitas:

1. **Tailwind CSS (via CDN — `https://cdn.tailwindcss.com`)**
   * **Finalidade:** Estilização responsiva da interface, layout do visor HUD e chassi do terminal LCD de pulso.
   * **Licença:** MIT License (Open Source).
2. **Font Awesome Free 6.5.1 (via CDNJS — `https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css`)**
   * **Finalidade:** Ícones vetoriais de telemetria, indicadores simbólicos do visor, controles de mapa e microfone.
   * **Licença:** Font Awesome Free License (CC BY 4.0 para ícones / SIL OFL 1.1 para fontes / MIT para código).
3. **Google Fonts — *Inter* e *JetBrains Mono* (`https://fonts.googleapis.com`)**
   * **Finalidade:** Tipografia de leitura limpa (*Inter*) e leitura técnica/numérica monoespaçada (*JetBrains Mono*).
   * **Licença:** SIL Open Font License 1.1 (OFL — livre para uso comercial e não comercial).

---

## 4. Recursos Visuais, Áudio e Mídia (100% Gerados Programaticamente)

* **Imagens, Mapas e Texturas de Superfície:** O projeto **não utiliza nenhuma fotografia externa protegida por direitos autorais**. Tanto o mapa topográfico sombreado (relevo DEM MOLA/HiRISE) quanto as visualizações de textura de superfície (`Surface Texture`) e o cenário em primeira pessoa do visor HUD são **gerados 100% proceduralmente via código** (HTML5 `<canvas>` com ruído fractal *fBm* e gráficos vetoriais `<svg>`).
* **Efeitos Sonoros:** Todos os sinais sonoros de alerta e confirmação tátil do botão físico são sintetizados em tempo real pelo próprio navegador por meio da **Web Audio API** nativa, sem arquivos `.mp3` ou `.wav` de terceiros.

---

## 5. Ferramentas de Desenvolvimento, APIs Nativas e Assistência

* **APIs Nativas do Navegador (W3C Standards):**
  * **Web Speech API (`SpeechRecognition` / `webkitSpeechRecognition`):** Reconhecimento de voz contínuo e bilíngue (Inglês e Português) para controle mãos-livres.
  * **Web Audio API (`AudioContext`):** Síntese de sinais acústicos de alerta e clique tátil.
  * **HTML5 Canvas & SVG DOM API:** Renderização cartográfica vetorial e geração procedural de relevo e texturas.
* **Ferramentas de Criação e Teste:**
  * **Google Gemini:** Assistência no desenvolvimento de código, estruturação matemática dos modelos físicos e documentação técnica.
  * **Visual Studio Code & Navegadores Web Modernos (Google Chrome / Microsoft Edge):** Edição de código-fonte, depuração e validação de interface e reconhecimento de voz.

---

## 6. Declaração de Conformidade de Direitos Autorais

Nenhum material protegido por direitos autorais de terceiros sem permissão foi incluído neste projeto. Todos os dados planetários são de domínio público oficial da **NASA** e do **USGS**, todas as bibliotecas externas possuem licenças abertas permissivas (**MIT** e **SIL OFL 1.1**) e todos os elementos gráficos, texturas e áudios foram criados originalmente via código para este projeto.ing E.S.G Dados & Recursos.md…]()
