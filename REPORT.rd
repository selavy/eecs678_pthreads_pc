Peter Lesslie
2208496
EECS 678 Lab
Producer and Consumer Lab

1. The purpose of this lab is to investigate the basic producer and consumer
problem. The producer and consumer problem is one in which one process (or
thread) is creating data, and another process (or thread) is using the data
produced by the other process (or thread).  Since the producer(s) and 
consumer(s) are using the same data, which is usually placed in a shared queue,
the processes (or threads) must be synchronized.  The simplest solution is
to use a mutex to lock operations on the queue so that only one process can
operate on the queue at a time.  The other process(es) that do not get the
mutex will either spin lock or sleep until they can get the lock.

2. The spin-lock solution is not efficient when both processes (or threads)
are being run on the same CPU because the operating system will still
schedule the spin-locked process (or thread), and that process (or thread)
will waste its entire time quantum in the spin lock.  The better solution
is to have the process (or thread) sleep until it can do work, this way
the scheduler will not schedule the thread when it knows that it cannot do
any work.  This done using a pthread_cond_t variable.

3. Program correctness is exponentially harder to proved in a multithreaded
 program as compared to a singly-threaded program because the scheduling of
threads done by the operating system makes the output non-deterministic.
However, by examing the output, it is easy to see that each producer and
consumer operates on a unique item, and that every number from 1 .. (MAX_WORK-1)
is being produced and consumed.  Additionally, each thread is created and
destroyed appropriately.  These factors are enough to allow me to be confident
that my solution is correct since this is a simple problem.