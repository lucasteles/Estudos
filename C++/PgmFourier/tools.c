#include <string.h>
#include <ctype.h>
typedef struct _PGMFile {
    int height;
    int width;
    int maxGray;
    int **matrix;
} PGMFile;


int **alloc_matrix(int height, int width)
{
    int **ret, i;

    ret = (int **)malloc(sizeof(int) * height);
    for (i = 0; i < height; ++i)
        ret[i] = (int *)malloc(sizeof(int) * width);

    return ret;
}

void free_matrix(int **matrix, int height)
{
    int i;
    for (i = 0; i < height; ++i)
        free(matrix[i]);
    free(matrix);
}

void CommentSkip(FILE *file)
{
    int ch;
    char line[100];

    while ((ch = fgetc(file)) != EOF && isspace(ch));

    if (ch == '#') {
        fgets(line, sizeof(line), file);
        CommentSkip(file);
    } else
        fseek(file, -1, SEEK_CUR);
}

PGMFile* ReadPGM(const char *fileName, PGMFile *data)
{
    FILE *pgmImg;
    char type[3];
    int i, j;
    int lo, hi;

    pgmImg = fopen(fileName, "rb");

    if (pgmImg == NULL) {
        perror("arquivo nao pode ser lido!");
        exit(EXIT_FAILURE);
    }

    fgets(type, sizeof(type), pgmImg);
    if (strcmp(type, "P5")) {
        fprintf(stderr, "Arquivo invalido!\n");
        exit(EXIT_FAILURE);
    }

    CommentSkip(pgmImg);
    fscanf(pgmImg, "%d", &data->width);

    CommentSkip(pgmImg);
    fscanf(pgmImg, "%d", &data->height);

    CommentSkip(pgmImg);
    fscanf(pgmImg, "%d", &data->maxGray);
    fgetc(pgmImg);

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


void SavePGM(const char *fileName, const PGMFile *data)
{
    FILE *pgmFile;
    int i, j;
    int  lo;

    pgmFile = fopen(fileName, "wb");
    if (pgmFile == NULL) {
        perror("Nao pode salvar arquivo");
        exit(EXIT_FAILURE);
    }

    fprintf(pgmFile, "P5 ");
    fprintf(pgmFile, "%d %d ", data->width, data->height);
    fprintf(pgmFile, "%d ", data->maxGray);


    for (i = 0; i < data->height; ++i)
        for (j = 0; j < data->width; ++j) {
            lo = data->matrix[i][j];
            fputc(lo, pgmFile);
        }


    fclose(pgmFile);
    free_matrix(data->matrix, data->height);
}

