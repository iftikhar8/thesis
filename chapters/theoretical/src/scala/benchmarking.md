# Benchmarking zissou

## RAM utilised

Tests to see how RAM speeds up particle movements for 140,000 particles.

Heap Space (Gb) | Time
----------------|-----------
Not specified   | 23m14.893s
4               | 23m18.843s
8               | 23m34.722s


## Closest reef search

Name                               | Time
-----------------------------------|-----------
Brute-force one pass using shapes  | 23m14.893s
Brute-force one pass using wrapper | 4m45.724s
Sorted arrays (binary search)      | 4m19.110s
Fast data structure                | n/a
