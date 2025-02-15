
# compiler 
BSC = bsc

# src director
SRC_DIR    = ./src
# target src code
SRCS       = ./src/UartRx.bsv ./src/uart_rx_top.bsv
TOP_MODULE = top

INCDIR  = ./src


# build release directory
BUILD_DIR  = ./build

TARGET = $(BUILD_DIR)/top.v

# $(BUILD_DIR)/mkUartRx.v: $(SRC_DIR)/UartRx.bsv
# 	$(BSC) -verilog -bdir $(BUILD_DIR) -vdir $(BUILD_DIR) -info-dir $(BUILD_DIR) -simdir $(BUILD_DIR) -g mkUartRx -u $(SRC_DIR)/UartRx.bsv

# Generate an executable.
$(TARGET): $(SRCS)
	$(BSC) -verilog -I $(INCDIR) -bdir $(BUILD_DIR) -fdir $(BUILD_DIR) -vdir $(SRC_DIR) -info-dir $(BUILD_DIR) -simdir $(BUILD_DIR) -g $(TOP_MODULE) -u $(SRC_DIR)/uart_rx_top.bsv

# make all
all: clean $(TARGET)

clean:
	rm -rf src/*.v
	rm -rf *.v
	rm -rf build/*

