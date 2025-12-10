# Ubuntuデスクトップ＋ROS2にアクセスするためのHTML5 VNCインターフェースを提供するDockerfile
このリポジトリは以下のリポジトリに基づいています
- https://github.com/Tiryoh/docker-ros2-desktop-vnc
- https://github.com/AI-Robot-Book-Humble









amd64
```
docker buildx build --platform=linux/amd64 --progress=plain -t tiryoh/ros2-desktop-vnc:jazzy-amd64 .
```
arm64
```
docker buildx build --platform=linux/arm64 --progress=plain -t okdhryk/ros2-desktop-vnc:jazzy-arm64 .
```

```
docker run -p 6080:80 --security-opt seccomp=unconfined --shm-size=512m okdhryk/ros2-desktop-vnc:jazzy-arm64
```
