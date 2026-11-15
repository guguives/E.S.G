# High-Level Project Summary: E.S.G. Terminal
**Extraterrestrial Survival Guide — Integrated Martian EVA Navigation & Science System**

---

## 1. What Did We Develop?
We developed **E.S.G. Terminal**, a dual-device Extravehicular Activity (EVA) navigation, safety, and geological field assistant designed for human surface exploration on Mount Sharp (*Aeolis Mons*) inside Gale Crater, Mars.

To match real spacesuit ergonomics, the interface is split into two synchronized displays:
* **Helmet Optical Visor (HUD):** A minimalist peripheral Heads-Up Display that keeps the astronaut’s central field of view clear while providing essential survival telemetry (heading, distance to rover and target, terrain slope vs. suit safety limit, remaining $\text{O}_2$ autonomy, radiation, atmospheric dust opacity, and visual/acoustic alerts when the walkback threshold is reached).
* **Spacesuit Forearm Wrist LCD (16:9 Dual-Mode Terminal):**
  * **Tactical Multi-Layer Map:** Overlays NASA and USGS orbital datasets onto a shaded Digital Elevation Model (DEM), dynamically computes optimal and contingency walking routes via **A\* pathfinding**, and renders a real-time **Metabolic Safe Return Isochrone** around the pressurized rover base.
  * **Science & Telemetry Deck:** Enables mission planners and astronauts to simulate payload/sample mass (`12–42 kg`), solar radiation events, and dust storms while inspecting stratigraphic contacts, spectral mineralogy, and surface texture references at each station.

The terminal supports both **bilingual hands-free voice control** (`EN-US` / `PT-BR`) and single-button tactile operation for pressurized EVA gloves.

---

## 2. How Does It Address the Challenge?
The challenge requires combining disparate NASA and USGS planetary datasets into a practical operational tool that helps astronauts safely traverse Martian terrain while conducting high-value science—without turning the experience into an unrealistic panic simulator.

**E.S.G. Terminal** directly solves this by:
1. **Fusing All 5 Mandatory NASA/USGS Data Sources:** Integrates topography and slope hazards (*NASA Mars Trek / MOLA*), stratigraphic units (*USGS Astrogeology*), rover baseline trajectories and radiation baselines (*Curiosity’s Proposed Path*), atmospheric optical depth (*NASA Worldview / Gale REMS*), and surface outcrop morphology (*Mars Raw Images*) into a single unified workflow.
2. **Replacing Guesswork with Real Martian Physics:** Uses a $28 \times 15$ Digital Elevation Model (`20 m` resolution) paired with **A\* routing** and the **Pandolf-Santee metabolic model** adapted for Martian gravity ($g = 3.72\ \text{m/s}^2$). Instead of drawing a static circle, the system calculates real oxygen expenditure across steep slopes and loose drift sand (`135 tiu`) to dynamically shape the astronaut's safe walkback perimeter and trigger contingency shelter routes when hazards arise.
3. **Human-Centered EVA Ergonomics:** Separates glanceable visor cues from deep forearm map analysis so explorers maintain natural situational awareness on rugged terrain.

---

## 3. Why Is It Important?
Wheeled rovers have transformed our understanding of Mars, yet steep scarps (`>16°`) and unconsolidated sand troughs frequently block robotic vehicles from reaching some of the planet’s most scientifically compelling outcrops—such as Mount Sharp’s groundwater-cemented **Boxwork ridges**, which preserve vital clues about ancient habitability.

Bridging that final kilometer requires human explorers, and human explorers require tools built for the realities of spacesuit mobility, limited oxygen reserves, and harsh environmental shifts. **E.S.G. Terminal** demonstrates how combining orbital remote sensing, metabolic physiology, and low-cognitive-load interface design can keep astronauts safe while maximizing scientific discovery on the Martian surface.
