# Ubuntuデスクトップ＋ROS2にアクセスするためのHTML5 VNCインターフェースを提供するDockerfile
このリポジトリは以下のリポジトリに基づいています
- https://github.com/Tiryoh/docker-ros2-desktop-vnc
- https://github.com/AI-Robot-Book-Humble



# 参照サイト
[docker-ros2-desktop-vnc](https://github.com/Tiryoh/docker-ros2-desktop-vnc)(2025.12.1)<br>
[ROS 2とPythonで作って学ぶAIロボット入門 改訂第2版のサポートサイト](https://github.com/AI-Robot-Book-Humble/docker-ros2-desktop-ai-robot-book-humble)(2025.6.1)<br>
[ROS/ROS2のGUIをWebブラウザ経由でお手軽に試せるDockerfileを公開しました](https://memoteki.net/archives/2955)(2020.5.20)<br>







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
% docker run -p 6080:80 -v ./share:/re --security-opt seccomp=unconfined --shm-size=512m okdhryk/ros2-desktop-vnc:jazzy-arm64
