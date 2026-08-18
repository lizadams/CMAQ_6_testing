PROGRAM hello_world_mpi

USE mpi
IMPLICIT NONE
 

! Variable declarations
    integer :: process_Rank   ! Stores the unique ID of the current process (0 to size-1)
    integer :: size_Of_Cluster ! Stores the total number of processes running
    integer :: ierror          ! Stores the error return code from MPI routines
    integer :: tag             ! Used to identify specific messages in send/receive operations

 

call MPI_INIT(ierror)

call MPI_COMM_SIZE(MPI_COMM_WORLD, size_Of_Cluster, ierror)

call MPI_COMM_RANK(MPI_COMM_WORLD, process_Rank, ierror)

 

print *, 'Hello World from process: ', process_Rank, 'of ', size_Of_Cluster

 

call MPI_FINALIZE(ierror)

END PROGRAM hello_world_mpi

