TARGET = jsonparser
CC = gcc
CFLAGS = -Wall -g
SRC = main.c jsonparser.c
OBJ = $(SRC:.c=.o)
TEST_SRC = test_jsonparser.c
TEST_OBJ = $(TEST_SRC:.c=.o)
LIBS = -lcmocka

all: $(TARGET)

$(TARGET): $(OBJ)
	@$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	@./$(TARGET)

clean:
	@rm -f $(OBJ) $(TARGET) $(TEST_OBJ) test

test: jsonparser.o $(TEST_OBJ)
	@$(CC) $(CFLAGS) -o test $(TEST_OBJ) jsonparser.o $(LIBS)
	@./test

help:
	@echo "Usage:"
	@echo "  make        - Compile the program"
	@echo "  make run    - Run the program"
	@echo "  make clean  - Remove compiled files"
	@echo "  make test   - Compile and run tests"
	@echo "  make help   - Show this help message"
