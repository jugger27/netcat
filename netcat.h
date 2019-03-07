

/*
 * Function-like macro definition used to close a socket.
 */

#if defined(HAVE_CLOSESOCKET)
#  define sclose(x)  closesocket((x))
#elif defined(HAVE_CLOSESOCKET_CAMEL)
#  define sclose(x)  CloseSocket((x))
#elif defined(HAVE_CLOSE_S)
#  define sclose(x)  close_s((x))
#elif defined(USE_LWIPSOCK)
#  define sclose(x)  lwip_close((x))
#else
#  define sclose(x)  close((x))
#endif
