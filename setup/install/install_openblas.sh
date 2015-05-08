# Chris - these may or may not be necessary
#export LDFLAGS=-L/usr/lib/gcc/x86_64-linux-gnu/4.6.4
#THEANO_FLAGS=blas.ldflags="-L/usr/local/lib/ -lblas"

# remove openblas if you installed it
sudo apt-get remove libopenblas-base
# Download the development version of OpenBLAS
git clone git://github.com/xianyi/OpenBLAS
cd OpenBLAS
make FC=gfortran

#sudo make PREFIX=/usr/local/ install
mkdir -p $HOME/local/openblas/
make PREFIX=$HOME/local/openblas install

# WORKING -- this still doesn't let us find openblas -gfortran during compilation of torch on ICHEC
echo '# OpenBLAS' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/local/openblas/lib' >> ~/.bashrc

source ~/.bashrc


# Tell Theano to use OpenBLAS.
# This works only for the current user.
# Each Theano user on that computer should run that line.
#echo -e "\n[blas]\nldflags = -L/home/chokamp/local/lib -lopenblas\n" >> ~/.theanorc
