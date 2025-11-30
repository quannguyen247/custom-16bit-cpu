# Custom 16-bit CPU Design

## Overview
This repository contains the complete source code and documentation for a **Custom 16-bit Central Processing Unit (CPU)**. This project serves as the **Final Term Project** for the Computer Architecture course at the **University of Information Technology, VNU-HCM**.

The design is built from the ground up, featuring a fully custom Instruction Set Architecture (ISA) inspired by the classic **MIPS** architecture. The project encompasses the entire design hierarchy, ranging from fundamental logic modules to the top-level CPU integration.

## Key Features
- **Architecture:** 16-bit Data Path and Address Space.
- **ISA Design:** Custom-defined instruction set optimized for educational demonstration and efficiency.
- **Modularity:** Hierarchical design including ALU, Register File, Control Unit, Program Counter, and Memory interfaces.
- **Completeness:** Includes all source codes (`src`) and testbenches (`tests`) for verification.

## Instruction Set Architecture (ISA)
Our custom ISA is designed with simplicity and orthogonality in mind, drawing heavy inspiration from MIPS but adapted for a 16-bit environment. The instruction set is categorized into three primary formats:

### 1. RRR Format (Register-Register-Register)
Used for arithmetic and logical operations involving three registers.
- **Structure:** `[Opcode] [Rd] [Rs] [Rt]`
- **Usage:** Operations where the result of `Rs` and `Rt` is stored in `Rd`.
- **Examples:** `ADD`, `SUB`, `AND`, `OR`, `XOR`.

### 2. RRI Format (Register-Register-Immediate)
Used for operations involving two registers and a constant (immediate) value.
- **Structure:** `[Opcode] [Rt] [Rs] [Immediate]`
- **Usage:** Arithmetic or logic operations with a constant, or load/store operations with offsets.
- **Examples:** `ADDI` (Add Immediate), `LW` (Load Word), `SW` (Store Word).

### 3. RI Format (Register-Immediate)
Used for operations requiring a larger immediate value or specific control flow instructions.
- **Structure:** `[Opcode] [Rd] [Immediate]`
- **Usage:** Loading upper immediate values, conditional branches, or jumps.
- **Examples:** `LUI` (Load Upper Immediate), `BEQ` (Branch if Equal), `JMP` (Jump).

## Project Structure
```
custom-16bit-cpu/
├── src/          # Source code for all modules (ALU, Control Unit, Datapath, etc.)
├── tests/        # Testbenches and simulation files
├── AUTHORS.md    # List of project contributors and supervisor
├── LICENSE       # MIT License
└── README.md     # Project documentation
```

## Getting Started
To simulate or synthesize this project:
1. Clone the repository.
2. Open the project in your preferred HDL simulator (e.g., ModelSim, Vivado, Quartus).
3. Add all files from the `src/` directory.
4. Run the testbenches located in `tests/` to verify functionality.

## Authors & Acknowledgments
This project was developed by a dedicated group of students from the **University of Information Technology (UIT - VNU-HCM)** under the supervision of **MSc. Ta Tri Duc**.

For a full list of contributors, please refer to the [AUTHORS.md](AUTHORS.md) file.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.