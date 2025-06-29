# 🧮 Asynchronous FIFO Buffer (Verilog)

This project implements an *Asynchronous FIFO (First-In-First-Out) buffer* in Verilog, designed for robust data transfer between two clock domains — commonly used in hardware interfaces like UART, SPI, or DMA buffers.

---

## 🔧 Features

- *Dual Clock Domains*  
  Separate wclk and rclk to support asynchronous data transfer.

- *Gray Code Pointers*  
  Used for reliable synchronization of read and write pointers across clock domains.

- *Status Flags*  
  - wfull — FIFO is full
  - rempty — FIFO is empty

- *Parameterizable Depth and Width*  
  Customize FIFO size using parameters.

- *Safe Pointer Synchronization*  
  Two-stage flip-flop synchronizers minimize metastability risk.
---
