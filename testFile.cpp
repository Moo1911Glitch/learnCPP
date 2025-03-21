#include <iostream>
#include <fstream>
#include <string>

int main()
{
  std::string line;
  std::ifstream f("testFile.txt");
  if (!f.is_open())
    perror("error while opening file");
  while (std::getline(f, line))
  {
    // process(&line);
    std::cout << line << std::endl;
  }
  if (f.bad())
    perror("error while reading file");
}
