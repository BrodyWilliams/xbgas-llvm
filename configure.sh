# Script for building xBGAS-enabled (rv64) LLVM toolchain
#LLVM_BUILD_DIR=/home/brody/xbgas_llvm_updates/build
LLVM_BUILD_DIR=/home/brody/xbgas-playground/build
CMPRT_SRC_DIR=/home/brody/xbgas_llvm_updates/compiler-rt

mkdir -p $LLVM_BUILD_DIR

CC=gcc CXX=g++ cmake -S llvm -B build -G Ninja \
	-DCMAKE_C_COMPILER=/usr/bin/gcc \
	-DCMAKE_CXX_COMPILER=/usr/bin/g++ \
	-DBUILD_SHARED_LIBS=True \
	-DLLVM_ENABLE_PROJECTS="clang;lld"  \
	-DLLVM_USE_SPLIT_DWARF=True \
	-DLLVM_OPTIMIZED_TABLEGEN=True \
	-DCMAKE_INSTALL_PREFIX=$LLVM_BUILD_DIR \
	-DCMAKE_BUILD_TYPE=Release \
	#-DDEFAULT_SYSROOT=$RISCV/riscv64-unknown-elf \
	-DDEFAULT_SYSROOT=$LLVM_BUILD_DIR/riscv64-unknown-elf \
	#-DGCC_INSTALL_PREFIX=$RISCV \
	-DGCC_INSTALL_PREFIX=$LLVM_BUILD_DIR \
	-DLLVM_TARGETS_TO_BUILD=RISCV \
	-DLLVM_PARALLEL_LINK_JOBS=1 \
	-DLLVM_BUILD_TESTS=True \
	-DLLVM_DEFAULT_TARGET_TRIPLE="riscv64-unknown-elf"

cmake --build build -- install

# Build compiler-rt separately

#cd $LLVM_BUILD_DIR

#PATH=$LLVM_BUILD_DIR/bin:$PATH \
#CC=$LLVM_BUILD_DIR/bin/clang \
#CXX=$LLVM_BUILD_DIR/bin/clang++ \
#cmake \
#  -DCMAKE_C_COMPILER=$LLVM_BUILD_DIR/bin/clang \
#  -DCMAKE_CXX_COMPIler=$LLVM_BUILD_DIR/bin/clang++ \
#  -DCMAKE_C_FLAGS="-target riscv64-unknown-elf -B $LLVM_BUILD_DIR/lib/gcc/riscv64-unknown-elf" \
#  -DCMAKE_CXX_FLAGS="-target riscv64-unknown-elf -B $LLVM_BUILD_DIR/lib/gcc/riscv64-unknown-elf" \
#  -DLLVM_CONFIG_PATH= $LLVM_BUILD_DIR/bin/llvm-config \
#  -DCMAKE_INSTALL_PREFIX= $LLVM_BUILD_DIR/lib/clang/14.0.0 \
#  $CMPRT_SRC_DIR

