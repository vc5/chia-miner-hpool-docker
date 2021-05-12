# Hpool-Miner-Chia-Docker
[Hpool-Miner-Chia](https://github.com/hpool-dev/chia-miner/releases)的docker镜像

# 如何使用

```bash
docker run --name miner \
   -v /path/to/plots:/plots \
   -v /path/to/config.yaml:/opt/config.yaml \
   vincent5/hpool-chia-miner
```

# 参考项目
[Kayuii/chia-plotter](https://github.com/Kayuii/chia-plotter)