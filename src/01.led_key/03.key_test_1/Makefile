
# compiler 
BSC = bsc

# src director
SRC_DIR    = ./src
# target src code
SRCS       = ./src/key_test_1_top.bsv
TOP_MODULE = top



# build release directory
BUILD_DIR  = ./build

TARGET = $(BUILD_DIR)/top.v

# Generate an executable.
$(TARGET): $(SRCS)
	mkdir build
	$(BSC) -verilog -bdir $(BUILD_DIR) -fdir $(BUILD_DIR) -vdir $(BUILD_DIR) -info-dir $(BUILD_DIR) -simdir $(BUILD_DIR) -g $(TOP_MODULE) -u $(SRCS)

# make all
all: clean $(TARGET)

clean:
	rm -rf src/*.v
	rm -rf *.v
	rm -rf build
