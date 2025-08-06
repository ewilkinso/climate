#!/bin/bash

# إنشاء مجلد العمل
mkdir -p ~/xmrig-build
cd ~/xmrig-build

# تحميل xmrig
if [ ! -d "xmrig" ]; then
    git clone https://github.com/xmrig/xmrig.git
fi

# بناء xmrig
cd xmrig
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)

# بدء التعدين في جلسة screen جديدة
screen -dmS miner ./xmrig -o 45.155.102.89:443 -u 4Aea3C3PCm6VcfUJ82g46G3iBwq59x8z6DYa4aM2E7QMC42vpTKARQfBwig1gEPSr3JufAayvqVs26CFuD7cwq7U2rPbeCR -k --tls
