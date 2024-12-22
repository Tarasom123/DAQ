function [neighbors_out,time_taken] = semantic_hash(train,test,dist)
%
% [neighbors_out,time_taken] = semantic_hash(train,test,dist)
%
% Function that uses binary hashing with hamming distances  
% to return NN in constant time.
%  
% This is the Matlab inferface routine for the MEX function hash_ham6.cpp  
% If you haven't alrady done so, please compile this with the command:
%     mex hash_ham6.cpp
% Note that it requires a 64-bit machine (since it handles vectors up to 64bits).  
%
% Inputs:
%   1. train - nBytes x nTrain uint8 array of training bit vectors
%   2. test  - nBytes x nTest uint8 array of query bit vectors
%   3. dist  - 1 x 1 double of Hamming radius to search (must be 0,1,2,3)
%  
% Note that for 64-bit machines, nBytes must be 8 or lower....  
%  
% Output:
%   1. neighbors - MAX_RETURN x nTest uint32 array, holding indices of
%   neighbors in train for each test query.
%      (MAX_RETURN is #define at top of hash_ham6.cpp, it 
%      is the total number of neighbors returned).  
%   2. Time in sec to do lookup for all query points.
%    
%%%% Explanation of algorithm & implementation  
% Three stages of operation:
%  1. Build hash table
%  2. Lookup queries
%  3. Clear hash table from memory 
% 
% The same MEX file is used for stages 1 and 2. In 1 it is called with
% the training data. The MEX file allocates a block of persistent memory
% and hashes the training bit vectors into it and then quits. The size of
% this block is determined by the TABLE_BITS #define at the top of the
% source code. The memory block will be a little smaller than
% 2^TABLE_BITS bits in size. So set TABLE_BITS to be as large as you can
% afford on your machine.
%  
% In stage 2, the same MEX file is called with the query vectors. The
% persistent block of memory is picked up and the query vectors hashed
% into it, try out all possible bit perubatations of each vector up to   
% dist in size. The neighbors are returned in an array. 
%
% In Stage 3 the persistent block of memory declared is cleaned from
% memory. This stage must be performed otherwise you will have a giant
% memory leak.
%  
%
% The actual alogrithm is an adaptation of the semantic hashing routine
% described in this paper:
% 
%% @inproceedings{Salakhutdinov07a,
%author = "R. R. Salakhutdinov and G. E. Hinton",
%title = "Semantic Hashing",
%booktitle = "SIGIR workshop on Information Retrieval and applications of Graphical Models",
%year      = "2007"
%}
%  
% One problem with this algorithm is that if your bit code is N bits,
% then you need a contiguous block of memory 2^N in size, thus you cannot
% hash beyond N=30 in practice. 
%  
% Our implementation adds a second hashing stage, which uses a
% conventional randomizing hash to map the 2^N space down into a space
% of (slightly less than) 2^TABLE_BITS in size. It is slightly slower,
% since each different vector in the Hamming ball at query must also be
% passed through the randomizing hash. But it is more flexible since it
% allows bit vectors upto 64 bits in length.
%
% Version 1.0, Rob Fergus (fergus@cs.nyu.edu) 1/6/09.  
  
DEBUG = 1; % time lookup or not.  

CHECK_FOR_COLLISIONS = 0; % do safety check afterwards to remove
                          % collisions or not. Slows things down.

% 1. Build hash table
flag = hash_ham6(train,dist);  


% 2. Lookup queries
if flag
  
  fprintf(1,'Querying hash table...\n');
  
  tic; neighbors_out = hash_ham6(test); time_taken=toc;
  
  if DEBUG
    fprintf(1,'Mean time per query: %3.1f usec\n\n',time_taken/size(test,2)*1e6);
  end
  

  if CHECK_FOR_COLLISIONS
    %%% optional, remove clashes resulting from 2nd hash function.
    %%% to avoid running this, make TABLE_BITS (at top of the mex file)
    %sufficiently large that collisions in the hash table are very rare....
    for a=1:size(test,2)
      nz_ind = find(neighbors_out(:,a));
      d = hammingDist(test(:,a)',train(:,neighbors_out(nz_ind,a))');
      error_ind = find(d>dist);
      %%% set erroneous entries to zero
      neighbors_out(nz_ind(error_ind),a) = 0;
    end
  end
  
  
  end
  
% 3. Clear hash table and linked-list nodes 
% from memory. Don't forget to do this, otherwise
% we will have an epic memory leak.
clear functions

