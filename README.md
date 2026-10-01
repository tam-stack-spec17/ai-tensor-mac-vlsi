# AI Tensor MAC Engine (RTL-to-GDSII)

An 8-bit Multiply-Accumulate (MAC) hardware accelerator architected in Verilog and synthesized into a physical silicon layout using the open-source SkyWater 130nm Process Design Kit (PDK).

This project demonstrates a complete automated physical design flow, targeting the core computational workload of neural network tensor processing.

## Physical Design (PPA Metrics)
The design was driven through the OpenLane EDA pipeline (Yosys, OpenROAD, Magic VLSI) achieving the following signoff metrics:
* **Target Clock Frequency:** 100 MHz (10.0ns period)
* **Silicon Area:** [Insert Area] µm²
* **Total Power:** [Insert Power] W
* **Violations:** 0 DRC, 0 LVS, 0 Setup/Hold

## EDA Toolchain
* **Logic Synthesis:** Yosys
* **Floorplanning & Placement:** OpenROAD
* **Clock Tree Synthesis (CTS) & Routing:** TritonCTS / FastRoute
* **Signoff (DRC/LVS):** Magic VLSI / Netgen
