#include "PGM.h"

int **alloc_matrix(int height, int width)
{
    int **ret, i;

    ret = (int **)malloc(sizeof(int*) * height);
    for (i = 0; i < height; ++i)
        ret[i] = (int*)malloc(sizeof(int) * width);

    return ret;
}

void free_matrix(int **matrix, int height)
{
    int i;
    for (i = 0; i < height; ++i)
        free(matrix[i]);
    free(matrix);
}

double **alloc_dmatrix(int height, int width)
{
    double **ret;
    int i;

    ret = (double **)malloc(sizeof(double*) * height);
    for (i = 0; i < height; ++i)
        ret[i] = (double*)malloc(sizeof(double) * width);

    return ret;
}

void free_dmatrix(double **matrix, int height)
{
    int i;
    for (i = 0; i < height; ++i)
        free(matrix[i]);
    free(matrix);
}

INumber **alloc_Imatrix(int height, int width)
{
    INumber **ret;
    int i;

    ret = (INumber **)malloc(sizeof(INumber*) * height);
    for (i = 0; i < height; ++i)
        ret[i] = (INumber*)malloc(sizeof(INumber) * width);

    return ret;
}

void free_Imatrix(INumber **matrix, int height)
{
    int i;
    for (i = 0; i < height; ++i)
        free(matrix[i]);
    free(matrix);
}

void commentskip(FILE *file)
{
    int ch;
    char line[100];

    while ((ch = fgetc(file)) != EOF && isspace(ch));

    if (ch == '#') {
        fgets(line, sizeof(line), file);
        commentskip(file);
    } else
        fseek(file, -1, SEEK_CUR);
}

PGM* readfile(const char *fileName, PGM *data)
{
    FILE *pgmImg;
    int i, j;
    int lo, hi;

    pgmImg = openpgm(fileName);
    commentskip(pgmImg);
    fscanf(pgmImg, "%d", &data->width);

    commentskip(pgmImg);
    fscanf(pgmImg, "%d", &data->height);

    commentskip(pgmImg);
    fscanf(pgmImg, "%d", &data->maxGray);
    fgetc(pgmImg);

    // aloca a matriz de pixels
    data->matrix = alloc_matrix(data->height, data->width);

    if (data->maxGray > 255)
        for (i = 0; i < data->height; ++i)
            for (j = 0; j < data->width; ++j) {
                hi = fgetc(pgmImg);
                lo = fgetc(pgmImg);
                data->matrix[i][j] = (hi << 8) + lo;
            }
    else
        for (i = 0; i < data->height; ++i)
            for (j = 0; j < data->width; ++j) {
                lo = fgetc(pgmImg);
                data->matrix[i][j] = lo;
            }

    fclose(pgmImg);
    return data;
}

void savefile(const char *fileName, const PGM *data)
{
    FILE *pgmFile;
    int i, j;
    int  lo;

    pgmFile = fopen(fileName, "wb");
    if (pgmFile == NULL) {
        perror("Nao pode salvar arquivo");
        exit(EXIT_FAILURE);
    }

    fprintf(pgmFile, "P5\n");
    fprintf(pgmFile, "%d %d\n", data->width, data->height);
    fprintf(pgmFile, "%d\n", data->maxGray);

    for (i = 0; i < data->height; ++i)
        for (j = 0; j < data->width; ++j) {
            lo = min(data->matrix[i][j],255);
            fputc(lo, pgmFile);
        }

    fclose(pgmFile);
    free_matrix(data->matrix, data->height);
}

FILE* openpgm(const char *fileName)
{
    FILE *pgmImg;
    char type[3];
    // abre o arquivo
    pgmImg = fopen(fileName, "rb");

    // se estiver nulo, deu algum problema para abrir o arquivo
    if (pgmImg == NULL) {
        perror("Arquivo nao pode ser lido!");
        exit(EXIT_FAILURE);
    }

    // verifica se existe p5 no começo do arquivo
    fgets(type, sizeof(type), pgmImg);
    if (strcmp(type, "P5")) {
        fprintf(stderr, "Arquivo invalido!\n");
        exit(EXIT_FAILURE);
    }

    return pgmImg;
}
