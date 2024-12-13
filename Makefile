
build:
	cargo build

run:
	cargo run

openocd:
	openocd

rtt:
# After -e set the target binary path
	nc localhost 8765 | defmt-print -e