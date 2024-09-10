TARGET = jsonparser
CC = gcc
CFLAGS = -Wall -g
SRC = src/main.c src/jsonparser.c
OBJ = $(SRC:.c=.o)
TEST_SRC = src/test_jsonparser.c
TEST_OBJ = $(TEST_SRC:.c=.o)
LIBS = -lcmocka
CLANG_TIDY = clang-tidy

all: $(TARGET)

$(TARGET): $(OBJ)
	@$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	@./$(TARGET)

clean:
	@rm -f $(OBJ) $(TARGET) $(TEST_OBJ) test

test: src/jsonparser.o $(TEST_OBJ)
	@$(CC) $(CFLAGS) -o test $(TEST_OBJ) src/jsonparser.o $(LIBS)
	@./test

lint:
	@$(CLANG_TIDY) $(SRC) -- $(CFLAGS)

help:
	@echo "Usage:"
	@echo "  make        - Compile the program"
	@echo "  make run    - Run the program"
	@echo "  make clean  - Remove compiled files"
	@echo "  make test   - Compile and run tests"
	@echo "  make lint   - Run clang-tidy"
	@echo "  make help   - Show this help message"
