/* 
 * echoserveri.c - An iterative echo server 
 */
/* $begin echoserverimain */
#include "../../code/include/csapp.h"
#define CLIENT_MESSAGE 1

static char message[CLIENT_MESSAGE];

int parse(int connfd);

void shutdown();
void start_plex();
void stop_plex();
void restart_plex();
void reboot();

/*
The purpose of this program is to enable users who are not
authenticated to perform basic operations such as shutting
down the host machine, restarting Plex Media Server and
other related jobs.
*/

/*
Server intended to connect to a host and perform an action
based on the client's input. For example, the user entering
1 will expect for Home-Media to shutdown.
*/

int main(int argc, char **argv)
{
    int listenfd, connfd;
    socklen_t clientlen;
    struct sockaddr_storage clientaddr; /* Enough space for any address */ //line:netp:echoserveri:sockaddrstorage
    char client_hostname[MAXLINE], client_port[MAXLINE];

    if (argc != 2)
    {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(0);
    }

    listenfd = Open_listenfd(argv[1]);
    while (1)
    {
        clientlen = sizeof(struct sockaddr_storage);
        connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);

        Getnameinfo((SA *)&clientaddr, clientlen, client_hostname, MAXLINE, client_port, MAXLINE, 0);
        printf("Connected to (%s, %s)\n", client_hostname, client_port);

        switch (parse(connfd))
        {
        case 1:
            shutdown();
            break;
        case 2:
            stop_plex();
            break;
        case 3:
            start_plex();
            break;
        case 4:
            restart_plex();
            break;
        case 5:
            reboot();
            break;
        }

        Close(connfd);
    }
    exit(0);
}

void shutdown()
{
    system("sudo shutdown -P now");
}

void start_plex()
{
    system("systemctl start plexmediaserver");
}

void stop_plex()
{
    system("systemctl stop plexmediaserver");
}

void restart_plex()
{
    system("systemctl restart plexmediaserver");
}

void reboot()
{
    system("reboot");
}

int parse(int connfd)
{
    size_t n;
    char buf[MAXLINE];
    rio_t rio;

    Rio_readinitb(&rio, connfd);
    while ((n = Rio_readlineb(&rio, buf, MAXLINE)) != 0)
    {
        Rio_writen(connfd, message, n);
        break;
    }
}