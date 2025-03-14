# Sediment Transport Calculator

The **Sediment Transport Calculator** is a graphical user interface (GUI) application designed to compute sediment transport rates using common coastal engineering equations. This tool is useful for researchers, engineers, and students working in coastal engineering and sediment transport studies.


To download the **.EXE** file, visit this [link](https://drive.google.com/file/d/137_9CPs8-XEsOolVuAuC_23UH1mE-e4Z/view?usp=sharing).

---

## **Features**
- **Interactive GUI:**  
  A user-friendly interface to input parameters and view results.
  
- **Real-Time Calculations:**  
  Computes sediment transport rates instantly when parameters are provided.
  
- **Error Handling:**  
  Displays alerts for invalid inputs to ensure accurate calculations.
  
- **Reset Functionality:**  
  Quickly reset all inputs and outputs to default values for a fresh start.

---

## **Input Parameters**
The following inputs are required (all fields accept numeric values):
- **Breaker Height (m):** Height of the breaking wave (Hb).
- **Breaking Angle (°):** Angle of the wave at the breaker line (heta_b).
- **K:** Empirical sediment transport coefficient.
- **Berm Height (m):** Height of the berm above the water level (B).
- **Depth of Closure (m):** Maximum depth of significant sediment motion (h^*).

---

## **Output Values**
The application calculates the following:
- **Sediment Transport Rate (Q) (m³/s):** Transport rate in cubic meters per second.
- **Annual Sediment Transport Rate (Qy) (m³/yr):** Transport rate extrapolated to one year.
- **Longshore Transport Rate (G) (m²/s):** Rate of sediment transported along the shore.

---

## **Getting Started**


### **Installation**
1. Clone this repository:
   ```bash
   git clone https://github.com/pouyazarbipour/sediment-transport-calculator.git
   ```
2. Open MATLAB and navigate to the cloned repository folder.
3. Open the `sediment_transport_calculator.m` file in MATLAB.

### **Usage**
1. Run GUI App
2. A GUI window will open. Enter the input parameters in the "Input Values" panel.
3. Click the **Calculate** button to compute sediment transport rates.
4. View the results in the "Output Values" panel.
5. Use the **Reset** button to clear inputs and outputs.

---

## **Equations**
The application uses the following equations:
1. **Wave Energy Flux (Eb)**  

Eb = (ρ * g * Hb²) / 8

2. **Sediment Transport Coefficient (Cq)**  

Cq = (K * Eb * Cb) / (ρ * g * (s - 1) * (1 - p))

3. **Sediment Transport Rate (Q)**  

Q = Cq * cos(θb) * sin(θb)

4. **Longshore Transport Rate (G)**  

G = (2 * Cq * cos(2 * θb)) / (h* + B)

---

## License  
This project is licensed under the MIT License. See the `LICENSE` file for details.  

---

## Contact  
For questions or feedback, please reach out to pouyazarbipour@gmail.com.

Enjoy using the **Sediment Transport Calculator** to explore and analyze coastal engineering scenarios!

