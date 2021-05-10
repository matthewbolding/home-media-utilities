/*
 * echoclient.c - An echo client
 */
/* $begin echoclientmain */
#include "../code/include/csapp.h"

int main(int argc, char **argv)
{
    int clientfd;
    char *host, *port, buf[MAXLINE];
    rio_t rio;

    if (argc != 3)
    {
        fprintf(stderr, "usage: %s <host> <port>\n", argv[0]);
        exit(0);
    }

    host = argv[1];
    port = argv[2];

    clientfd = Open_clientfd(host, port);
    Rio_readinitb(&rio, clientfd);

    fprintf(stdout, "\nUsage for client side operations consist of\n1) shutting down the computer,\n2) stopping, starting, and restarting Plex Media Server, and \n3) restarting Home-Media.\n");
    fprintf(stdout, "\nusage: <operation number>");
    fprintf(stdout, "\noperation numbers:\n\t1: shutdown the computer\n\t2: stop plexmediaserver\n\t3: start plexmediaserver\n\t4: restart plexmediaserver\n\t5: restart computer");

    while (Fgets(buf, MAXLINE, stdin) != NULL)
    {
        if (!(strcmp(buf, "1")) || 
            !(strcmp(buf, "2")) || 
            !(strcmp(buf, "3")) || 
            !(strcmp(buf, "4")) || 
            !(strcmp(buf, "5")))
        {
            fprintf(stderr, "usage: <operation number>\n");
        }
        else
        {
            Rio_writen(clientfd, buf, strlen(buf));
            Rio_readlineb(&rio, buf, MAXLINE);
            Fputs(buf, stdout);
        }
    }

    Close(clientfd); //line:netp:echoclient:close
    exit(0);
}
/* $end echoclientmain */
