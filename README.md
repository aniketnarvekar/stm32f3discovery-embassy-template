# embassy-template for STM32F3 Discovery Kit

Simple template to generate an embassy project for the STM32F3Discovery kit. Make sure you've run `cargo install cargo-generate` before using.

This is a template created for my personal usage. The template allows printing DEFMT logs.

I was using [embassy-template](https://github.com/lulf/embassy-template) for my projects. But always to reconfigure for STM32F3 Discovery MCU, which is time-consuming. The template by default doesn't have debug configuration support for any controller (which is not the purpose of the template, I assume). I also wanted to add support to print DEFMT logs. So there is a need to create a template for my specific use case.

I'm more comfortable using a GDB session in terminal. So the template doesn't support VS Code interactive debugger. The template does give you a Makefile to build a project and start an Open OCD server, start a GDB session, and a listener to print DEFMT log messages in the console. (NOTE: You need 3 terminal sessions for the Open OCD server, GDB session, and DEFMT listener.)

The template is a fork of [embassy-template](https://github.com/lulf/embassy-template). The “openocd.cfg” and “openocd.gdb” files are sourced from [cortex-m-quickstart](https://github.com/rust-embedded/cortex-m-quickstart) template and modified according to my use case (which is to add support to start the RTT server). [Click here](https://github.com/aniketnarvekar/stm32f3discovery-embassy-template/blob/6598f12db5e23310c4f8734ead68bfa6c88c6788/openocd.gdb#L37-L45) for the changes.

Before running `make rtt` make sure to set the executable binary path to after `-e ` in rtt section of [Makefile](https://github.com/aniketnarvekar/stm32f3discovery-embassy-template/blob/6598f12db5e23310c4f8734ead68bfa6c88c6788/Makefile#L13). The code is sourced from the very useful post [Using GDB and DEFMT to debug embedded programs.](https://ferrous-systems.com/blog/gdb-and-defmt/#defmt-print)

You may have to change the location address of rtt control block. Click [here](https://ferrous-systems.com/blog/gdb-and-defmt/#defmt-print) for more information.

## Usage

```
cargo generate --git https://github.com/aniketnarvekar/stm32f3discovery-embassy-template.git
```

## References:
- [embassy-template](https://github.com/lulf/embassy-template)
- [cortex-m-quickstart](https://github.com/rust-embedded/cortex-m-quickstart)
- [Using GDB and DEFMT to debug embedded programs](https://ferrous-systems.com/blog/gdb-and-defmt/#defmt-print)
- [Embassy Book](https://embassy.dev/book/#_cargo_generate)
