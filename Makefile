C=gcc
CFLAGS=-I$(IDIR)
OUTDIR_DEBUG=dist/Debug
OUTDIR_RELEASE=dist/Release
# LDIR =/data/lib

LIBS= -lm 

all:
	mkdir -p $(OUTDIR_DEBUG)
	$(CC) -c src/stream.c -o stream.o
	$(CC) -c src/mp4.c -o mp4.o
	$(CC) -c src/mp4parser.c -o mp4parser.o
	$(CC) stream.o mp4.o mp4parser.o -o $(OUTDIR_DEBUG)/mp4parser $(LIBS)
	rm -f *.o


debug:
	mkdir -p $(OUTDIR_DEBUG)
	$(CC) -ggdb -g3 -c src/stream.c -o stream.o
	$(CC) -ggdb -g3 -c src/mp4.c -o mp4.o
	$(CC) -ggdb -g3 -c src/mp4parser.c -o mp4parser.o
	$(CC) stream.o mp4.o mp4parser.o -o $(OUTDIR_DEBUG)/mp4parser $(LIBS)
	rm -f *.o

clean:
	rm -f *.o
	rm -f $(OUTDIR)/mp4parser
