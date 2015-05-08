# for ICHEC
# load a newer version of cmake
module load dev 
module load cmake/intel/3.0.2


git clone git://github.com/andresy/torch.git
cd torch
mkdir build
cd build
mkdir -p $HOME/local/torch
cmake .. -DCMAKE_INSTALL_PREFIX=/$HOME/local/torch
make install

echo '# chris: added during torch installation' >> ~/.bashrc 
echo 'export PATH=/$HOME/local/torch/bin:$PATH' >> ~/.bashrc 

# export the libs -- was getting an error running `torch` until I did this
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/local/torch/lib:$HOME/local/torch/lib/torch/lua

