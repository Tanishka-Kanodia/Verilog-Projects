# 📦 Synchronous FIFO Buffer (Verilog)

This project implements a *Synchronous FIFO (First-In-First-Out)* buffer in Verilog HDL, ideal for buffering data within the same clock domain. FIFO structures are commonly used in digital systems to manage data flow between producer and consumer logic operating at the same speed.

---

## ✅ Features

- *Single Clock Domain*  
  Shared clock (clk) for both read and write operations.

- *Configurable Depth and Width*  
  Parameters to set data width and buffer depth.

- *Status Flags*  
  - full_o: FIFO is full, no further writes allowed  
  - empty_o: FIFO is empty, no valid data to read  

- *Efficient Pointer Management*  
  Simple binary pointers with wrap-around and comparison logic.

- *Synthesizable Design*  
  Clean and minimal RTL suitable for ASIC/FPGA use.

---
