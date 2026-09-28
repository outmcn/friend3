# Friend3 Figma 页面提取清单

来源：`FriendAPP.fig`（Figma 文件名：06-社交媒体移动APP）

## 已提取

- 原始 Figma 压缩工程：`design/figma-source/`
- Figma 元数据：`design/figma-source/meta.json`
- Figma 画布数据：`design/figma-source/canvas.fig`
- 缩略图：`design/figma-source/thumbnail.png`
- 图片资源：`design/figma-source/images/`（3822 个，PNG 3715 个、JPEG 107 个）
- 非 72×72 图片资源联系表：`design/figma-contact-1.jpg` 至 `design/figma-contact-4.jpg`

## 页面级提取状态

| 页面 | Figma 原始 Frame 高清导出 | Flutter 页面 | 状态 |
|---|---:|---:|---|
| 引导页 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 登录页 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 注册页 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 信息收集 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 首页 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 发现 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 创建帖子 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 通知 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 我的 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 设置/账户切换 | 待从 canvas.fig 定位 | 已有静态页面 | 待 1:1 还原 |
| 帖子详情/评论 | 待从 canvas.fig 定位 | 尚未完整建立 | 待实现 |
| 直播观看/弹幕/礼物 | 待从 canvas.fig 定位 | 暂不做直播间 | 已排除 |

## 资源统计

- Figma 包大小：约 38M
- 解压后资源目录：约 41M
- 可解码图片：3822
- PNG：3715
- JPEG：107
- 72×72 小图：3699（大部分可能是头像/缩略图/组件资源）
- 非 72×72 图片：123

## 当前边界

本次只提取和整理 Figma 文件，不接真实后端，不改变 Friend3 业务功能。
Figma `canvas.fig` 是二进制画布数据，当前环境没有直接读取 Figma 私有画布结构的解析器，因此尚未将每个 Frame 自动命名或导出成页面截图；不能把缩略图当作逐页 1:1 设计稿。
