# DNSAmplificationScanner
This script will scan through given hostname and IP list and will test every host if it can be used for DNS Amplification attack.

File list.txt should contain IP adresses or hostnames each in new line.
Script will output list of servers which have response size larger then 3000 bytes.
It will also print the latency between you and DNS server.
This script is created to quickly scan for vulnerable DNS resolvers and should not be used for finding targets.  
