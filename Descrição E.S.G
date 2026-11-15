[Descrição E.S.G.md](https://github.com/user-attachments/files/34881267/Descricao.E.S.G.md)
# Project Overview & Technical Details: E.S.G. Terminal
**Extraterrestrial Survival Guide — Integrated Martian EVA Navigation & Science System**  
**Target Region:** Lower Northwest Flank of Mount Sharp (*Aeolis Mons*), Gale Crater, Mars (`5.4°S, 137.8°E`)

---

## 1. What Exactly Does It Do?
**E.S.G. Terminal** is an interactive, multi-device Extravehicular Activity (EVA) navigation, safety, and field-geology assistant designed for astronauts operating on the surface of Mars. 

In Gale Crater, pressurized rovers must stage at safe, flat bedrock plains (such as *Lower Murray Plain*, `WP-01`) when confronted with steep scarps (`>16°`) and unconsolidated aeolian sand troughs (`135 tiu`) that pose high wheel-entrapment risks. From that staging point, astronauts execute a `940 m` foot traverse up the foothills of Mount Sharp to sample the **Boxwork Ridges (`WP-04`)**—polygonal, sulfate-cemented fracture networks formed by ancient subsurface groundwater.

To support this traverse without overwhelming the astronaut, the system splits mission telemetry across **two synchronized interfaces**:
1. **Helmet Optical Visor (HUD):** A minimalist, peripheral Heads-Up Display that keeps the astronaut’s central field of view completely unobstructed while displaying real-time heading, target distance, terrain slope vs. suit safety limit, remaining $\text{O}_2$ autonomy, radiation exposure, atmospheric optical depth ($\tau$), and symbolic/acoustic alerts when the walkback threshold is reached.
2. **Spacesuit Forearm Wrist LCD (16:9 Dual-Mode Terminal):**
   * **Screen A (Tactical Multi-Layer Map):** Combines NASA and USGS orbital datasets over a Digital Elevation Model (DEM), dynamically recalculates optimal and contingency walking paths using **A\* pathfinding**, and renders a real-time **Metabolic Safe Return Isochrone** around the rover/base.
   * **Screen B (Science & Telemetry Deck):** Allows astronauts and mission planners to adjust suit payload mass (`12–42 kg`), simulate solar radiation (SEP) and dust storm scenarios, inspect stratigraphic and spectral mineralogy at each waypoint, and preview surface textures before arrival.

---

## 2. How Does It Work?
Rather than relying on static illustrations, **E.S.G. Terminal** runs a client-side physics, terrain, and voice-interaction engine:

* **Digital Elevation Model (DEM) & Trigonometric Slope Analysis:** The terrain is modeled as a $28 \times 15$ elevation and thermal-inertia grid (`20 m` per cell) representing the Murray, Stimson, and Sulfate-bearing units of Mount Sharp. For every adjacent cell transition, the engine computes exact horizontal distance and terrain grade ($\theta = \arctan(\Delta z / \Delta d)$).
* **Dynamic A\* (*A-Star*) Pathfinding:** Whenever the astronaut selects a station, clicks any cell on the map, or changes carried payload weight, the A\* router recalculates both the **Primary EVA Route** and the **Northern Scarp Contingency Route**. Cells exceeding the suit's dynamic maximum safe slope (`maxSafeSlope`) are automatically blocked, while low-thermal-inertia drift sand (`135 tiu`) is heavily penalized.
* **Martian Metabolic Physics (Pandolf-Santee Model at $g = 3.72\ \text{m/s}^2$):** Using the Pandolf-Santee metabolic load equations adapted for Martian gravity ($3.72\ \text{m/s}^2$), the system calculates instantaneous metabolic power (in Watts) and oxygen consumption ($\text{L/min}$) based on total mass (suit + payload/samples), walking speed, uphill/downhill grade, and soil firmness derived from THEMIS thermal inertia.
* **Dynamic $\text{O}_2$ Safe Return Isochrone & Acoustic Alert:** Using the Pandolf-Santee energy cost across 32 radial vectors, the map draws a deformed, non-circular perimeter showing the exact distance the astronaut can travel and still return to base with a mandatory `45 L` reserve. If the astronaut crosses this threshold, the Helmet Visor triggers a high-visibility **Mandatory Return** badge and synthesizes a multi-pulse alert chime via the **Web Audio API**.
* **Bilingual Hands-Free Voice Control & Tactile Hardware Parity:** Powered by the **Web Speech API** (`en-US` and `pt-BR`), astronauts can switch LCD screens, pan/zoom the map, toggle scientific layers, select waypoints, and dismiss alerts hands-free—or operate the terminal with a pressurized glove via a single large analog bezel button.

---

## 3. What Benefits Does It Have?
* **Unifies Siloed NASA & USGS Datasets:** Merges altimetry/slope (*Mars Trek / MOLA*), stratigraphic contacts (*USGS Astrogeology*), thermal trafficability (*THEMIS*), spectral mineralogy (*CRISM*), rover baseline routes (*Curiosity*), atmospheric opacity (*Worldview / REMS*), and surface texture references (*Mars Raw Images*) into one operational decision tool.
* **Prevents Cognitive Overload During EVA:** Separates glanceable survival cues (Helmet Visor) from deep cartographic and geological analysis (Forearm LCD), preserving natural human situational awareness on rugged terrain.
* **Replaces Static Distance Estimates with Real Physics:** Because climbing a steep, sandy slope consumes far more oxygen than walking on flat bedrock, a simple circular distance ring can mislead an astronaut. The Pandolf-Santee isochrone reflects true physiological exertion in Martian gravity.
* **Zero-Dependency Resilience:** Runs 100% client-side with procedural DEM terrain, procedural surface textures, and synthesized audio—ensuring instant responsiveness with zero network latency or API rate-limit failures.

---

## 4. What Do We Hope to Achieve?
Our primary goal is to demonstrate how **human-centered interface design** and **planetary science data fusion** can bridge the gap between robotic precursor missions and human surface exploration on Mars. 

Specifically, we aim to:
1. Provide a practical blueprint for future planetary EVA software that prioritizes **astronaut safety, metabolic awareness, and geological productivity** rather than treating surface operations like a sci-fi survival game.
2. Enable explorers to safely reach high-value astrobiological targets—such as Mount Sharp's groundwater-formed **Boxwork ridges**—that wheeled rovers struggle to traverse due to steep scarps and loose regolith.

---

## 5. Tools, Coding Languages, Hardware & Software Used
* **Core Coding Languages:** HTML5, CSS3, and Vanilla JavaScript (ES6+).
* **Styling & Iconography Frameworks:**
  * **Tailwind CSS** (MIT License) for responsive layout and hardware-bezel styling.
  * **Font Awesome Free 6.5.1** (CC BY 4.0 / MIT) for telemetry and HUD iconography.
  * **Google Fonts (*Inter* & *JetBrains Mono*)** (SIL Open Font License 1.1) for legibility and technical numeric readouts.
* **Native Browser APIs (W3C Standards):**
  * **HTML5 Canvas & SVG DOM API:** Procedural fractal Brownian motion (*fBm*) shaded-relief DEM generation, geological texture synthesis, and interactive vector cartography.
  * **Web Speech API (`SpeechRecognition` / `webkitSpeechRecognition`):** Continuous bilingual (`EN-US` / `PT-BR`) hands-free voice command recognition.
  * **Web Audio API (`AudioContext`):** Real-time synthesis of turnaround warning tones and tactile bezel button feedback without external audio files.
* **Scientific Data Sources (Public Domain — NASA / USGS):**
  * **NASA Mars Trek** (`trek.nasa.gov/mars`) — MOLA/HRSC topography, slope hazards, THEMIS thermal inertia, and CRISM spectral bands.
  * **USGS Astrogeology Interactive Maps** — Gale Crater stratigraphic units (*Murray*, *Stimson*, *Sulfate-Bearing Unit*).
  * **NASA Science — Curiosity's Proposed Path Up Mount Sharp** — Rover ascent reference and MSL-RAD radiation baselines.
  * **NASA Worldview & Gale REMS** — Atmospheric dust optical depth ($\tau$), pressure, wind, and temperature baselines.
  * **NASA Mars Raw Images** — Analog surface outcrop morphology and traction reference.
* **Development Software & Hardware:**
  * **Software:** Visual Studio Code, Google Chrome / Microsoft Edge (for Web Speech & Web Audio validation), and **Google Gemini** (for code architecture, mathematical modeling, and technical documentation).
  * **Hardware:** Standard workstation/laptop with integrated microphone (simulating helmet comms headset) and mouse/touch input (simulating gloved forearm bezel interaction).
