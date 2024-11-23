#../configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/usr --enable-checking=release --enable-languages=c,c++,d,fortran,go,lto,objc,obj-c++ --disable-multilib --program-suffix=-$1
../configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/usr --enable-checking=release --enable-languages=c,c++,d,fortran,go,lto,objc,obj-c++,rust,m2 --disable-multilib --program-suffix=-$1

