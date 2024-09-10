TARGET = jsonparser
CC = gcc
CFLAGS = -Wall -g
SRC = main.c
OBJ = $(SRC:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJ)
	@$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	@./$(TARGET)

clean:
	@rm -f $(OBJ) $(TARGET)

help:
	@echo "Usage:"
	@echo "  make        - Compile the program"
	@echo "  make run    - Run the program"
	@echo "  make clean  - Remove compiled files"
	@echo "  make help   - Show this help message"
