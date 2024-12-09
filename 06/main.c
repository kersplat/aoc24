#include <stdio.h>

// #define MAX_LENGTH 10
// #define MAX_WIDTH 10
#define MAX_LENGTH 130
#define MAX_WIDTH 130

int main() {
  char map[MAX_LENGTH][MAX_WIDTH];
  char guard_direction = 'N';

  FILE *file;
  file = fopen("input.txt", "r");

  int ch = 0;
  int x = 0;
  int y = 0;
  int guard_x = 0;
  int guard_y = 0;

  while ((ch = fgetc(file)) != EOF) {
    if (ch == '\n') {
      x++;
      y = 0;
    } else {
      map[x][y] = (char)ch;
      if (map[x][y] == '^') {
        guard_x = x;
        guard_y = y;
        map[x][y] = 'X';
      }
      y++;
    }
  }

  fclose(file);

  int z = 0;
  int in_area = 1;
  while (in_area) {
    switch (guard_direction) {
    case 'N':
      if (map[guard_x - 1][guard_y] == '#') {
        guard_direction = 'E';
      } else {
        map[guard_x][guard_y] = 'X';
        guard_x--;
        z++;
        break;
      }
    case 'E':
      if (map[guard_x][guard_y + 1] == '#') {
        guard_direction = 'S';
      } else {
        map[guard_x][guard_y] = 'X';
        guard_y++;
        z++;
        break;
      }
    case 'S':
      if (map[guard_x + 1][guard_y] == '#') {
        guard_direction = 'W';
      } else {
        map[guard_x][guard_y] = 'X';
        guard_x++;
        z++;
        break;
      }
    case 'W':
      if (map[guard_x][guard_y - 1] == '#') {
        guard_direction = 'N';
      } else {
        map[guard_x][guard_y] = 'X';
        guard_y--;
        z++;
        break;
      }
    }

    if (guard_x < 0 || guard_x >= MAX_LENGTH || guard_y < 0 ||
        guard_y >= MAX_WIDTH) {
      in_area = 0;
    }
  }

  printf("z: %d\n", z);
  int visited_positions = 0;
  for (int i = 0; i < MAX_LENGTH; i++) {
    for (int j = 0; j < MAX_WIDTH; j++) {
      printf("%c", map[i][j]);
      if (map[i][j] == 'X') {
        visited_positions++;
      }
    }
    printf("\n");
  }

  // You're too high
  printf("Visited positions %d\n", visited_positions);

  return 0;
}
