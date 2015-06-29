#include "stdio.h"
#include "stream.h"
#include "mp4.h"

int main(int argc, char* argv[])
{
   mp4_box_t *root, *SearchResult;
   stream_t* s;

   if(argc < 2){
       printf("Invalid argument, useage: \n mp4parser /path/to/mp4file \n");
       return -1;
   }

   s = create_file_stream();
   if (stream_open(s, argv[1], MODE_READ) == 0){
        printf("Can not open file\n");
      return -1;
   }

   SearchResult = MP4_BoxGetRoot(s);

   printf("search result box is %c%c%c%c\n",SearchResult->i_type&0x000000ff,(SearchResult->i_type&0x0000ff00)>>8,(SearchResult->i_type&0x00ff0000)>>16,(SearchResult->i_type&0xff000000)>>24);

   MP4_BoxFree(s, root);
   MP4_BoxFree(s, SearchResult);

   stream_close(s);
   destory_file_stream(s);

	return 0;
}

