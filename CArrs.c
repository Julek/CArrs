#include <stdlib.h>

int arrCreate();
int arrWrite(int n, int pos, int value);
int arrRead(int n, int pos);

int **arrays = NULL;
int *arrays_s = NULL;
int num = 0;

int arrCreate()
{

  if(num)
    {
      arrays = realloc(arrays, sizeof(int*)*(num + 1));
      arrays_s = realloc(arrays_s, sizeof(int*)*(num + 1));
    }
  else
    {
      arrays = malloc(sizeof(int*));
      arrays_s = malloc(sizeof(int));
    }
  
  arrays_s[num] = 1;

  arrays[num] = malloc(sizeof(int));
  arrays[num][0] = 0;
  ++num;
  return num - 1;
}


int arrWrite(int n, int pos, int value)
{

  if(pos < arrays_s[n])
    arrays[n][pos] = value;
  else
    {
      arrays[n] = realloc(arrays[n], sizeof(int)*(pos + 1));
      for(int i = arrays_s[n]; i < (pos - 1); ++i)
	arrays[n][i] = 0;
      arrays[n][pos] = value;
      arrays_s[n] = pos + 1;
    }
  return n;
}

int arrRead(int n, int pos)
{

  if(pos < arrays_s[n])
    return arrays[n][pos];
  else
    return 0;
}
