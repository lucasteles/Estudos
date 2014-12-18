#ifndef FILEMAGANER_H_INCLUDED
#define FILEMANAGER_H_INCLUDED
#define GDP_READ_LINE_SIZE 30

char* gdp_files_getstring(FILE* fFile, char* cParameter);
int gdp_files_getint(FILE* fFile, char* cParameter);
double gdp_files_getfloat(FILE* fFile, char* cParameter);

FILE* gdp_files_open(char* FileName);
void gdp_files_close(FILE *FilePointer);

char* gdp_files_quick_getstring(char* FileName, char* cParameter);
int gdp_files_quick_getint(char* FileName, char* cParameter);
double gdp_files_quick_getfloat(char* FileName, char* cParameter);


#endif
