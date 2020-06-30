# To rebuild a target every time it is called independent of last changes
.PHONY: main clean all 

# Variables
main_script="scripts/bootstrap.sh"

# Targets
all: main

main: 
	@bash $(main_script)
	